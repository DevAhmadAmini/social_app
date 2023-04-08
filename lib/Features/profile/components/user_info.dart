import 'package:flutter/material.dart';

import '../../../utils/styles/text_styles.dart';

class ProfileInfoWidget extends StatelessWidget {
  final String username;
  final String bio;
  const ProfileInfoWidget({
    super.key,
    required this.username,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          username,
          textAlign: TextAlign.center,
          style: kSimpleTextStyle.copyWith(fontSize: 22),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 9, bottom: 18),
          child: Text(
            "kabul, Afghanistan",
            textAlign: TextAlign.center,
            style: ksmallBlueGrey,
          ),
        ),
        Text(
          bio,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff081A5C),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
