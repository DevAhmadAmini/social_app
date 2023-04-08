import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeaderUserInfo extends StatelessWidget {
  final String username;
  final String datePublished;
  final String avatarUrl;
  const HeaderUserInfo({
    super.key,
    required this.username,
    required this.datePublished,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: CachedNetworkImageProvider(avatarUrl),
          radius: 26,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // post username
              Text(
                username,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              // post datePublished
              Text(
                datePublished,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
