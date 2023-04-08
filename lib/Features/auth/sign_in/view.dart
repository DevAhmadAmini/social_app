import 'package:flutter/material.dart';

import 'package:chat_app/Features/auth/sign_in/sections/page_footer.dart';
import 'package:chat_app/Features/auth/sign_in/sections/image.dart';
import 'package:chat_app/Features/auth/sign_in/sections/text_fields.dart';


class SignInScreen extends StatefulWidget {
  static String id = "sign-in-screen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            SignInImage(),
            SizedBox(
              height: 48.0,
            ),
            SignInTextFields(),
            SizedBox(
              height: 24.0,
            ),
            SignInButton(),
          ],
        ),
      ),
    );
  }
}
