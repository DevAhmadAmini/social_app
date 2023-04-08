// ignore_for_file: use_build_context_synchronously

// All logic all are used in this page

import 'package:flutter/material.dart';

import 'dart:io';
import 'package:chat_app/Features/auth/Sign%20up/email_and_password/networking.dart';
import '../../../../../utils/methods/navigators.dart';
import '../../../widgets/round_button.dart';
import 'package:chat_app/utils/methods/showing_snackbar.dart';
import 'package:chat_app/utils/styles/text_styles.dart';

class SignupButton extends StatefulWidget {
  const SignupButton({super.key, required this.image});
  final File? image;

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  final Registration _registration = Registration();
  bool isRegistered = false;

  // Registring the user to firebase
  Future<void> registerUser() async {
    try {
      isRegistered = true;
      setState(() {});
      // Register user to auth
      await _registration.registerUser();
      // save file to storage
      String? file = await _registration.addAvatarToStorage(widget.image);

      // add user data to firestore
      await _registration.addUserDataToFirestore(avatarUrl: file);
      isRegistered = false;
      setState(() {});
      // Navigating to Sign in screen If success
      navigateToSignIn(context);
    } catch (error) {
      print(error);
      showErrorSnackBar(context);
      isRegistered = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      text: isRegistered
          ? const CircularProgressIndicator(
              color: Colors.deepPurple,
            )
          : const Text(
              "Sign up",
              style: kButtonTextStyle,
            ),
      onPressed: registerUser,
    );
  }
}
