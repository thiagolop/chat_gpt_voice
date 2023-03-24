import 'package:chat_gpt/app/controller/chat_gpt_controller.dart';
import 'package:chat_gpt/app/core/app_theme.dart';
import 'package:chat_gpt/app/widgets/app_bar.dart';
import 'package:chat_gpt/app/widgets/chat_widget.dart';
import 'package:chat_gpt/app/widgets/send_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatGptPage extends StatefulWidget {
  const ChatGptPage({Key? key}) : super(key: key);

  @override
  State<ChatGptPage> createState() => _ChatGptPageState();
}

class _ChatGptPageState extends State<ChatGptPage> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatGptController>(
      builder: (context, value, child) {
        return Scaffold(
            appBar: CHATAppBar(
              onPressedDelete: value.clear,
            ),
            backgroundColor: AppTheme.primaryLightColor,
            body: AnimatedBuilder(
              animation: value,
              builder: (_, child) => SizedBox.expand(
                child: Column(
                  children: [
                    ChatWidget(
                      controller: value,
                    ),
                    SendMessageWidget(
                      onPressedPause: value.pause,
                      onPressedPlay: value.play,
                      onPressedStop: value.stop,
                      flagMostraControlesTextToSpeech: value.flagMostraControlesTextToSpeech,
                      messageController: messageController,
                      sendOnPressed: () {
                        if (messageController.text.isEmpty) {
                          return;
                        } else {
                          value.addMessages(messageController.text);
                          messageController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
