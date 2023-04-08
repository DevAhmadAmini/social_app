import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AddCommentBox extends StatelessWidget {
  TextEditingController commentController = TextEditingController();
  final String avatarUrl;
  VoidCallback onPressed;
  AddCommentBox({
    super.key,
    required this.commentController,
    required this.avatarUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(avatarUrl),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 222,
            child: TextField(
              controller: commentController,
              decoration: const InputDecoration(
                hintText: "What is in your mind?  ",
                border: InputBorder.none,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              "post",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
