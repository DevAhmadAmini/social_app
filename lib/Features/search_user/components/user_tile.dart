import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../profile/screens/users_profile.dart';

class UserTile extends StatelessWidget {
  final String text;
  final String avatarUrl;
  final VoidCallback onPressed;
  final String id;
  const UserTile({
    super.key,
    required this.text,
    required this.avatarUrl,
    required this.onPressed,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserProfileScreen(
                        uid: id,
                      )));
        },
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: avatarUrl,
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 14),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
