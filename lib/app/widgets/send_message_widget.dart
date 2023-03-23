import 'package:chat_gpt/app/core/app_theme.dart';
import 'package:chat_gpt/app/widgets/voice_widget.dart';
import 'package:flutter/material.dart';

class SendMessageWidget extends StatelessWidget {
  final void Function()? sendOnPressed;
  final void Function() onPressedStop;
  final void Function() onPressedPause;
  final void Function() onPressedPlay;
  final bool flagMostraControlesTextToSpeech;
  final TextEditingController messageController;
  const SendMessageWidget({
    super.key,
    this.sendOnPressed,
    required this.messageController,
    required this.flagMostraControlesTextToSpeech,
    required this.onPressedStop,
    required this.onPressedPause,
    required this.onPressedPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Visibility(
            visible: flagMostraControlesTextToSpeech,
            child: VoiceWidget(
              onPressedStop: onPressedStop,
              onPressedPause: onPressedPause,
              onPressedPlay: onPressedPlay,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.send,
                  style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  maxLines: 4,
                  minLines: 1,
                  controller: messageController,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: sendOnPressed,
                      child: const Icon(Icons.send, color: Colors.black),
                    ),
                    hintText: 'Digite uma mensagem',
                    border: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primaryColor)),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
