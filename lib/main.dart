import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:we_chat_app/auth/auth_gate.dart';
import 'package:we_chat_app/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDzXYqKG12XjjAAcdrWleIBsN9IeHqBBe8",
      appId: "1:605546278260:android:a29acd76f8ba65a13d1021",
      messagingSenderId: "605546278260",
     projectId: "wechatapp-423f5",
      ),
  )
  :await Firebase.initializeApp();
  runApp(const MainApp()); 
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: lightMode,
    );
  }
}

