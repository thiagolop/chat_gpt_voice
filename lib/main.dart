import 'package:chat_gpt/app/pages/chat_gpt_page.dart';
import 'package:chat_gpt/app/providies/providies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: AppProviders.providers,
    child: const ChatGPT(),
  ));
}

class ChatGPT extends StatelessWidget {
  const ChatGPT({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat GPT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatGptPage(),
    );
  }
}
