import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CustomTextField(
              controller: emailController,
              hint: "Email",
            ),

            const SizedBox(height: 20),

            CustomTextField(
              controller: passwordController,
              hint: "Password",
              obscure: true,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Login"),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignupScreen(),
                  ),
                );
              },
              child: const Text("Create Account"),
            )
          ],
        ),
      ),
    );
  }
}