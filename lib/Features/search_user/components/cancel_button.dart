import 'package:flutter/material.dart';

import '../../../utils/styles/text_styles.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Cancel",
        textAlign: TextAlign.end,
        style: kSmallblackBold.copyWith(
          color: const Color(0xff081A5C),
        ),
      ),
    );
  }
}
