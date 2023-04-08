import 'package:chat_app/Features/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/Features/auth/Sign%20up/email_and_password/view.dart';
import 'package:chat_app/Features/auth/sign_in/networking.dart';
import 'package:chat_app/Features/auth/widgets/round_button.dart';
import 'package:chat_app/utils/methods/showing_snackbar.dart';
import 'package:chat_app/utils/styles/text_styles.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  bool isLoading = false;
  void login() async {
    try {
      isLoading = true;
      setState(() {});
      await Login().signingIn();
      isLoading = false;
      Navigator.pushNamed(context, HomeScreen.id);
    } catch (error) {
      showErrorSnackBar(context);
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RoundButton(
          text: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.purple,
                )
              : const Text(
                  "Log In",
                  style: kButtonTextStyle,
                ),
          onPressed: login,
        ),
        const SizedBox(height: 9),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignupScreen.id);
          },
          child: RichText(
            text: const TextSpan(
              style: kSmallblackBold,
              children: [
                TextSpan(text: "Already have an Account? "),
                TextSpan(
                  text: "Sign up",
                  // recognizer: TapGestureRecognizer()
                  //   ..onTap = navigateToSignup(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
