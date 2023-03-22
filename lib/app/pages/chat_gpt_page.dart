import 'package:chat_gpt/app/controller/chat_gpt_controller.dart';
import 'package:chat_gpt/app/core/app_theme.dart';
import 'package:chat_gpt/app/widgets/app_bar.dart';
import 'package:chat_gpt/app/widgets/chat_widget.dart';
import 'package:chat_gpt/app/widgets/send_message_widget.dart';
import 'package:flutter/material.dart';

class ChatGptPage extends StatefulWidget {
  const ChatGptPage({Key? key}) : super(key: key);

  @override
  State<ChatGptPage> createState() => _ChatGptPageState();
}

class _ChatGptPageState extends State<ChatGptPage> {
  final ChatGptController controller = ChatGptController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CHATAppBar(onPressed: () => controller.clear()),
        backgroundColor: AppTheme.primaryLightColor,
        body: AnimatedBuilder(
          animation: controller,
          builder: (_, child) => SizedBox.expand(
            child: Column(
              children: [
                ChatWidget(
                  controller: controller,
                ),
                SendMessageWidget(
                  messageController: messageController,
                  sendOnPressed: () {
                    if (messageController.text.isEmpty) {
                      return;
                    } else {
                      controller.addMessages(messageController.text);
                      messageController.clear();
                    }
                  },
                  micOnPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
