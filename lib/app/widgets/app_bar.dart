import 'package:chat_gpt/app/core/app_theme.dart';
import 'package:flutter/material.dart';

class CHATAppBar extends AppBar {
  final VoidCallback onPressed;
  CHATAppBar({
    super.key,
    required this.onPressed,
  }) : super(
          elevation: 10,
          backgroundColor: AppTheme.primaryColor,
          title: const Text('Chat GPT'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        );
}
