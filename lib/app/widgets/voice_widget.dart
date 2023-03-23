import 'package:chat_gpt/app/core/app_theme.dart';
import 'package:flutter/material.dart';

class VoiceWidget extends StatelessWidget {
  final void Function() onPressedStop;
  final void Function() onPressedPause;
  final void Function() onPressedPlay;
  const VoiceWidget({
    super.key,
    required this.onPressedStop,
    required this.onPressedPause,
    required this.onPressedPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [AppTheme.primaryColor, AppTheme.messageBOT],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: onPressedStop, icon: const Icon(Icons.stop), color: Colors.white),
          IconButton(onPressed: onPressedPause, icon: const Icon(Icons.pause), color: Colors.white),
          IconButton(onPressed: onPressedPlay, icon: const Icon(Icons.play_arrow), color: Colors.white),
        ],
      ),
    );
  }
}
