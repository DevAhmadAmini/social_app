import 'package:flutter/material.dart';

import '../../../../utils/styles/container_decoration.dart';

class SignInTextFields extends StatelessWidget {
  static String? email;
  static String? password;
  const SignInTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            email = value;
          },
          decoration: kTextFieldStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextField(
          obscureText: true,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            password = value;
          },
          decoration: kTextFieldStyle.copyWith(
            hintText: "Enter your Password",
          ),
        ),
      ],
    );
  }
}
