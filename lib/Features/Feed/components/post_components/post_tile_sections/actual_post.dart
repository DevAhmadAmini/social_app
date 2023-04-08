import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ActualPostWidget extends StatelessWidget {
  final String postDescription;
  final String photoUrl;
  const ActualPostWidget({
    super.key,
    required this.postDescription,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 2, bottom: 14),
          child: Text(
            postDescription,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          color: Colors.amber,
          child: CachedNetworkImage(
            imageUrl:
                photoUrl,
            height: 220,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ),
      ],
    );
  }
}
