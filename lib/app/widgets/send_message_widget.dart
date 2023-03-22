import 'package:chat_gpt/app/core/app_theme.dart';
import 'package:flutter/material.dart';

class SendMessageWidget extends StatefulWidget {
  final void Function()? sendOnPressed;

  final TextEditingController messageController;
  const SendMessageWidget({
    super.key,
    this.sendOnPressed,
    required this.messageController,
  });

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  void sendOnPressed() {
    widget.sendOnPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.send,
              style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              maxLines: 4,
              minLines: 1,
              controller: widget.messageController,
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
    );
  }
}
