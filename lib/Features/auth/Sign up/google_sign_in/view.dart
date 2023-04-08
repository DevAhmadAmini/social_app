import 'package:chat_app/Features/auth/Sign%20up/google_sign_in/networking.dart';
import 'package:flutter/material.dart';

class GoogleSign extends StatefulWidget {
  const GoogleSign({super.key});

  @override
  State<GoogleSign> createState() => _GoogleSignState();
}

class _GoogleSignState extends State<GoogleSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await GoogleLogin().loginWithGoogleAccount();
            await GoogleLogin().addGoogleAccountDataToFirestore();
            setState(() {});
          },
          child: const Text("Google Sign In"),
        ),
      ),
    );
  }
}
