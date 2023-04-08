import 'package:flutter/material.dart';

import '../../../utils/styles/text_styles.dart';

class RoundButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onPressed;
  const RoundButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
