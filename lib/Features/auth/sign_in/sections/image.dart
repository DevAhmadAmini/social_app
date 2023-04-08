import 'package:flutter/material.dart';

class SignInImage extends StatelessWidget {
  const SignInImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Hero(
        tag: 'Developer',
        child: SizedBox(
          height: 200.0,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
