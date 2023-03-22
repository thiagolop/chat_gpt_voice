import 'package:chat_gpt/app/controller/chat_gpt_controller.dart';
import 'package:chat_gpt/app/core/app_theme.dart';
import 'package:flutter/material.dart';


class ChatWidget extends StatelessWidget {
  final ChatGptController controller;
  
  const ChatWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.messages.length,
        itemBuilder: (_, index) {
          final message = controller.messages[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: message['me'] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: message['me'] ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 5, right: 10),
                      child: Text(
                        '${message['data'].day}/${message['data'].month}/${message['data'].year}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: message['me'],
                          child: InkWell(
                            onTap: () {
                              // TextToSpeech tts = TextToSpeech();
                              // tts.speak(message['message'].toString().trim());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, top: 5, right: 10),
                              child: const Icon(
                                Icons.record_voice_over,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: message['me'] ? AppTheme.messageMe : AppTheme.messageBOT,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              message['message'].toString().trim(),
                              style: TextStyle(color: message['me'] ? Colors.black : Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: message['me'] == false,
                          child: InkWell(
                            // onTap: () {
                            //   // TextToSpeech tts = TextToSpeech();
                            //   // tts.speak(message['message'].toString().trim());
                            // },
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, top: 5, right: 10),
                              child: const Icon(
                                Icons.record_voice_over,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 5, right: 10),
                  child: Text(
                    '${message['data'].hour}:${message['data'].minute}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
