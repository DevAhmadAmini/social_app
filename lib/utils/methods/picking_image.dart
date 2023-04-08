// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File> pickImageFromGallery() async {
  XFile? file = await ImagePicker().pickImage(
    imageQuality: 90,
    source: ImageSource.gallery,
  );
  File image = File(file!.path);
  return image;
}

Future<File> pickImageFromCamera() async {
  XFile? file = await ImagePicker().pickImage(
    imageQuality: 90,
    source: ImageSource.camera,
  );
  File image = File(file!.path);
  return image;
}

// We use this dialog while signing up
Future<File?> pickImageDialog({
  required BuildContext context,
}) async {
  File image;
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: const Text("Please Choose Your Avatar"),
      children: [
        TextButton(
          onPressed: () async {
            image = await pickImageFromCamera();
            Navigator.of(context).pop(image);
          },
          child: const Text("take photo with Camera"),
        ),
        TextButton(
          onPressed: () async {
            image = await pickImageFromGallery();
            Navigator.of(context).pop(image);
          },
          child: const Text("Choose Image form Gallery"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
      ],
    ),
  );
}
