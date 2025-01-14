import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6), // Balanced margin for the tile
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // More comfortable padding
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary, // Slightly darker background color
          borderRadius: BorderRadius.circular(15), // Smooth rounded corners
          border: Border.all(
            color: Theme.of(context).colorScheme.primary, // Slightly faded border color
            width: 1.5, // Thinner border for a sleek look
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.secondary, // Primary color for the icon
              size: 28, // Adjust icon size for better balance
            ),
            const SizedBox(width: 15), // Adequate space between icon and text
            Expanded( // Allow text to occupy the remaining space
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 17, // Slightly larger text for readability
                ),
                overflow: TextOverflow.ellipsis, // Handle overflow gracefully
              ),
            ),
          ],
        ),
      ),
    );
  }
}
