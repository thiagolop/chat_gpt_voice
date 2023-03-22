import 'package:chat_gpt/app/core/app_theme.dart';
import 'package:flutter/material.dart';

class CHATAppBar extends AppBar {
  final VoidCallback onPressedDelete;

  CHATAppBar({
    super.key,
    required this.onPressedDelete,
  }) : super(
          elevation: 10,
          backgroundColor: AppTheme.primaryColor,
          title: const Text('Chat GPT'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: onPressedDelete,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        );
}
