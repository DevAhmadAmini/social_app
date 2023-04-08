import 'package:flutter/material.dart';

import 'package:chat_app/Features/Feed/components/post_components/post_tile_sections/header_user_info.dart';
import 'post_components/post_tile_sections/actual_post.dart';
import 'post_components/post_tile_sections/footer_info.dart';

class PostTile extends StatelessWidget {
  // postInfo is all post Info which we get from parent widget
  final Map<String, dynamic>? postInfo;
  final String datePublished;
  const PostTile({
    super.key,
    required this.postInfo,
    required this.datePublished,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          HeaderUserInfo(
            username: postInfo!["username"],
            avatarUrl: postInfo!["avatarUrl"],
            datePublished: datePublished,
          ),
          ActualPostWidget(
            postDescription: postInfo!["text"],
            photoUrl: postInfo!["photoUrl"],
          ),
          FooterInfo(
            likes: postInfo!["likes"],
            postId: postInfo!["postId"],
          ),
          const Divider(
            height: 30,
            thickness: 1.5,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
