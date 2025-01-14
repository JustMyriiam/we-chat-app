import 'package:flutter/material.dart';
import 'package:we_chat_app/services/auth/auth_service.dart';
import 'package:we_chat_app/components/my_button.dart';
import 'package:we_chat_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(title: Text("Error !")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface, // Set the background color to white
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/33.png',
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              MyTextfield(
                hintText: "Email",
              
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 10),
              MyTextfield(
                hintText: "Password",
                obscureText: true,
                controller: _pwController,
              ),
              const SizedBox(height: 20),
              MyButton(
                text: "Login",
                onTap: () => login(context),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
