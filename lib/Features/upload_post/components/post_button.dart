import 'package:flutter/material.dart';

import '../../../utils/styles/text_styles.dart';

class PostButton extends StatelessWidget {
  final VoidCallback onPost;
  const PostButton({
    super.key,
    required this.onPost,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPost,
      child: Text(
        "post",
        style: kSimpleTextStyle.copyWith(
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
