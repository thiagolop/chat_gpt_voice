import 'package:chat_gpt/app/controller/chat_gpt_controller.dart';
import 'package:chat_gpt/app/core/app_theme.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  final ChatGptController controller;

  const ChatWidget({
    super.key,
    required this.controller,
  });

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: widget.controller.scrollController,
        itemCount: widget.controller.messages.length,
        itemBuilder: (_, index) {
          final message = widget.controller.messages[index];
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message['me'] ? AppTheme.messageMe : AppTheme.messageBOT,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.controller.toWrite(message['message'].toString().trim()),
                        style: TextStyle(color: message['me'] ? Colors.black : Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: message['me'] ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 5, right: 10),
                      child: Text(
                        '${message['data'].hour}:${message['data'].minute}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    widget.controller.message == message['message'].toString().trim()
                        ? IconButton(
                            onPressed: () {
                              widget.controller.stop();
                            },
                            icon: const Icon(Icons.voice_over_off),
                          )
                        : IconButton(
                            onPressed: () {
                              widget.controller.speak(message['message'].toString().trim());
                            },
                            icon: const Icon(Icons.record_voice_over),
                          ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
