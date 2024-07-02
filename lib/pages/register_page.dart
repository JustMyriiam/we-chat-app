import 'package:flutter/material.dart';
import 'package:we_chat_app/auth/auth_service.dart';
import 'package:we_chat_app/components/my_button.dart';
import 'package:we_chat_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();

    if(_pwController.text == _confirmPwController.text) {
      try {
            _auth.signUpWithEmailAndPassword(_emailController.text, _pwController.text);

      } catch(e) {
           showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
      }
    }

    else {
        showDialog(
        context: context,
        builder: (context) => const AlertDialog(title: Text("Passwords don't match")),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/33.png',
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Let's create an account for you",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 16,
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
                
                const SizedBox(height: 10),
                MyTextfield(
                    hintText: "Confirm password",
                    obscureText: true,
                    controller: _confirmPwController,
                  ),
                
                const SizedBox(height: 20),
                
                  MyButton(
                    text: "Register",
                    onTap: () => register(context),
                  ),
                
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Login now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
