import 'package:flutter/material.dart';

import '../../../utils/styles/text_styles.dart';

class UserStatisticsWidget extends StatelessWidget {
  final String text;
  final int number;
  const UserStatisticsWidget({
    super.key,
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Text(
            "${number.toInt()}",
            style: kSimpleTextStyle.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: ksmallBlueGrey,
          ),
        ],
      ),
    );
  }
}
