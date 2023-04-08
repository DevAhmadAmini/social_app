import 'package:flutter/material.dart';

import '../../../../../utils/styles/container_decoration.dart';

class SignupTextFields extends StatefulWidget {
  static String? email;
  static String? password;
  static String? username;
  static String? bio;
  const SignupTextFields({
    super.key,
  });

  @override
  State<SignupTextFields> createState() => _SignupTextFieldsState();
}

class _SignupTextFieldsState extends State<SignupTextFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            SignupTextFields.email = value;
          },
          decoration: kTextFieldStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextField(
          obscureText: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
          ),
          onChanged: (value) {
            SignupTextFields.password = value;
          },
          decoration: kTextFieldStyle.copyWith(
            hintText: "Enter your Password",
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
          ),
          onChanged: (value) {
            SignupTextFields.username = value;
          },
          decoration: kTextFieldStyle.copyWith(
            hintText: "Enter your username",
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
          ),
          onChanged: (value) {
            SignupTextFields.bio = value;
          },
          decoration: kTextFieldStyle.copyWith(
            hintText: "Enter your bio",
          ),
        ),
      ],
    );
  }
}
