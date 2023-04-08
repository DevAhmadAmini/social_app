import 'package:flutter/material.dart';

class VerticalLineWidget extends StatelessWidget {
  const VerticalLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 1,
      color: Colors.grey.shade300,
    );
  }
}
