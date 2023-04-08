import 'package:flutter/material.dart';

class EraseButton extends StatelessWidget {
  final VoidCallback onPressed;
  const EraseButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.close,
      color: Colors.blueGrey,
      size: 28,
    );
  }
}
