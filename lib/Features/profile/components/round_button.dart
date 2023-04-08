import 'package:flutter/material.dart';

import '../../../utils/styles/container_decoration.dart';
import '../../../utils/styles/text_styles.dart';

class ProfileRoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ProfileRoundButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kContainerDecoration,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
