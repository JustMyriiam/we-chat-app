import 'package:flutter/material.dart';
import 'package:we_chat_app/components/my_drawer.dart';
import 'package:we_chat_app/services/auth/auth_service.dart';
import 'package:we_chat_app/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }



Widget _buildUserList() {
  return StreamBuilder(
    stream: _chatService.getUsersStream(),
    builder: (context, snapchot) {
      if (snapchot.hasError) {
        return const Text("Error");
      }
      if (snapchot.connectionState == ) {

      }
    },
  );
}
}