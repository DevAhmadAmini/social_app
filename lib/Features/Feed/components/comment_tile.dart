import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class CommentTile extends StatelessWidget {
  var commentInfo;
  String commentDatePublished;
  CommentTile({
    super.key,
    required this.commentInfo,
    required this.commentDatePublished,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(
                  commentInfo["avatarUrl"],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    commentInfo["username"] ?? "",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    commentDatePublished,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              commentInfo["commentText"],
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 20,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
