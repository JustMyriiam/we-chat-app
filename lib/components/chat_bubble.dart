import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode; 
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ?  (isDarkMode? Colors.blueGrey: Colors.amber): (isDarkMode? Colors.blueGrey: Colors.blue),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Text(
        message,
        style: TextStyle(
          color: isCurrentUser? Colors.white: (isDarkMode? Colors.white: Colors.black),
        ),
    ));
  }
}
