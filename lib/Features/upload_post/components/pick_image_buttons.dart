import 'package:flutter/material.dart';

import 'dart:io';
import 'package:chat_app/utils/methods/picking_image.dart';

class CameraImageWidget extends StatelessWidget {
  final void Function(File? image)? onPressed;
  const CameraImageWidget({
    super.key,
    required this.onPressed,
  });

  void pickImage() async {
    File? cameraImage = await pickImageFromCamera();
    // take cameraImage and send it to parent widget using callBack
    onPressed!(cameraImage);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: SizedBox(
        height: 105,
        width: 105,
        child: Image.asset("assets/images/camera.png"),
      ),
    );
  }
}

class GalleryImageWidget extends StatelessWidget {
  final void Function(File? image)? onPressed;
  const GalleryImageWidget({
    super.key,
    required this.onPressed,
  });

  void pickImage() async {
    File? galleryImage = await pickImageFromGallery();
     // take galleryImage and send it to parent widget using callBack
    onPressed!(galleryImage);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: SizedBox(
        height: 84,
        width: 84,
        child: Image.asset("assets/images/gallery.png"),
      ),
    );
  }
}
