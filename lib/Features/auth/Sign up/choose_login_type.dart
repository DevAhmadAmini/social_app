import 'package:chat_app/Features/auth/sign_in/view.dart';
import 'package:flutter/material.dart';
import 'google_sign_in/view.dart';

class LoginTypeScreen extends StatelessWidget {
  const LoginTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.id);
              },
              child: const Text("Sign in with email and password"),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GoogleSign()));
              },
              child: const Text("Sign In with google account"),
            ),
          ],
        ),
      ),
    );
  }
}
