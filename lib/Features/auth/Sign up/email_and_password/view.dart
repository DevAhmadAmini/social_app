import 'package:flutter/material.dart';

import 'dart:io';
import 'package:chat_app/Features/auth/Sign%20up/email_and_password/sections/page_button.dart';
import 'package:chat_app/Features/auth/Sign%20up/email_and_password/sections/user_avatar.dart';
import 'package:chat_app/Features/auth/Sign%20up/email_and_password/sections/page_text_fields.dart';

class SignupScreen extends StatefulWidget {
  static String id = "sign-up-screen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // file we get from userAvatar
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // First section
            TopCircleAvatar(
              onPressed: (file) {
                image = file;
                setState(() {});
                //TODO figure it what was wrong 
              },
            ),
            const SizedBox(
              height: 48.0,
            ),
            // Second Section
            const SignupTextFields(),
            const SizedBox(
              height: 24.0,
            ),
            // Third section
            SignupButton(
              image: image,
            ),
          ],
        ),
      ),
    );
  }
}
