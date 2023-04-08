// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';

import 'dart:io';
import '../../../../../utils/methods/picking_image.dart';

class TopCircleAvatar extends StatefulWidget {
  const TopCircleAvatar({super.key, required this.onPressed});
  final void Function(File image) onPressed;

  @override
  State<TopCircleAvatar> createState() => _TopCircleAvatarState();
}

class _TopCircleAvatarState extends State<TopCircleAvatar> {
  // we call pickImageDialog (utils) and take image from image picker and  send it back to parent widget (view)

  void takeImage() async {
    image = await pickImageDialog(context: context);
    setState(() {});
    widget.onPressed(image!);
  }

  File? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: takeImage,
      child: image != null
          ? CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey,
              backgroundImage: FileImage(image!),
            )
          : const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey,
            ),
    );
  }
}
