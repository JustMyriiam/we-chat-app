import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 127, 127, 127), // Darker shade of blue-gray
    secondary: Color.fromARGB(255, 154, 72, 116), // Slightly more vibrant pink
    primary: Color.fromARGB(255, 155, 155, 155), // Deeper blue
    tertiary: Color.fromARGB(255, 104, 104, 104), // Darker shade of blue-gray
    onTertiary: Color.fromARGB(255, 59, 103, 139), // Lighter shade of blue
  ),
);