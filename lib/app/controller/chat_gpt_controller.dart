import 'package:chat_gpt/app/repositories/chat_gpt_repositorie.dart';
import 'package:chat_gpt/app/repositories/chat_gpt_repositorie_imp.dart';
import 'package:chat_gpt/app/service/dio_service_imp.dart';
import 'package:flutter/material.dart';

class ChatGptController with ChangeNotifier {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final List<Map<String, dynamic>> messages = [];
  final ChatGptRepository _chatGptRepository = ChatgptRepositoryImp(DioServiceImp());

  addMessages(String message) async {
    messages.add({'data': DateTime.now(), 'message': message, 'me': true});
    notifyListeners();
    final response = await _chatGptRepository.promptMessage(message);
    messages.add({'data': DateTime.now(), 'message': response, 'me': false});
    scrollToBottom();
    notifyListeners();
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  void clear() {
    messages.clear();
    notifyListeners();
  }
}
