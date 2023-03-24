import 'package:chat_gpt/app/repositories/chat_gpt_repositorie.dart';
import 'package:chat_gpt/app/repositories/chat_gpt_repositorie_imp.dart';
import 'package:chat_gpt/app/service/dio_service_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatGptController with ChangeNotifier {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final List<Map<String, dynamic>> messages = [];
  final ChatGptRepository _chatGptRepository = ChatgptRepositoryImp(DioServiceImp());
  FlutterTts flutterTts = FlutterTts();
  bool get flagMostraControlesTextToSpeech => message.isNotEmpty;
  String message = '';

  addMessages(String message) async {
    messages.add({'data': DateTime.now(), 'message': message, 'me': true});
    notifyListeners();
    toWrite(message);
    final response = await _chatGptRepository.promptMessage(message);
    messages.add({'data': DateTime.now(), 'message': response, 'me': false});
    scrollToBottom();
    notifyListeners();
    Future.delayed(const Duration(seconds: 1), () {
      speak(response);
    });
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  void clear() {
    messages.clear();
    stop();
    notifyListeners();
  }

  String toWrite(String message) {
    messageController.text = message;
    return message;
  }

  Future<bool> speak(String value) async {
    flutterTts.setLanguage("pt-BR");
    flutterTts.setVoice({"name": "Karen", "locale": "pt-BR"});
    flutterTts.setPitch(1);
    await flutterTts.awaitSpeakCompletion(true);
    message = value;
    notifyListeners();
    if (message.isNotEmpty) {
      await flutterTts.speak(message).then((value) {
        if (value == 1) stop();
      });
    }
    return true;
  }

  void stop() async {
    await flutterTts.stop();
    message = '';
    notifyListeners();
  }

  void pause() {
    flutterTts.pause();
    notifyListeners();
  }

  void play() {
    flutterTts.speak(message).then((value) => stop());
  }
}
