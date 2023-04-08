import 'package:flutter/material.dart';

class PostTextField extends StatelessWidget {
  final TextEditingController postController;
  const PostTextField({super.key, required this.postController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: postController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "What do you want to talk about?",
        hintStyle: TextStyle(fontSize: 18),
      ),
      maxLines: 5,
    );
  }
}
