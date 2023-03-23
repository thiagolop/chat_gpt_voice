import 'package:chat_gpt/app/controller/chat_gpt_controller.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static final providers = [
    ChangeNotifierProvider<ChatGptController>(
      create: (_) => ChatGptController(),
    ),
  ];
}
