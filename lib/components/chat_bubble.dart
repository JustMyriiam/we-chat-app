import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chat_app/themes/theme_provider.dart';

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
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
        decoration: BoxDecoration(
          color: isCurrentUser
              ? (isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary)
              : (isDarkMode ? Theme.of(context).colorScheme.surface :  Theme.of(context).colorScheme.onTertiary),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Text(
          message,
          style: TextStyle(
            color: 
                (isDarkMode ? Colors.white : Colors.black),
          ),
        ));
  }
}
