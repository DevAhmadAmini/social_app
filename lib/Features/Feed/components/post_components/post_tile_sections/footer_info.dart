import 'package:chat_app/Features/Feed/screens/comment_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../logic/like_post.dart';

class FooterInfo extends StatelessWidget {
  final List likes;
  final String postId;
  FooterInfo({
    super.key,
    required this.likes,
    required this.postId,
  });
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void likePost() async {
    await Like().likePost(likes, postId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // like button
            IconButton(
              // liking the post
              onPressed: likePost,
              icon: Icon(
                Icons.thumb_up,
                color: likes.contains(_auth.currentUser!.uid)
                    ? Colors.blue
                    : Colors.black,
              ),
            ),
            // comment button
            IconButton(
              onPressed: () {
                // navigating to comment screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => CommentScreen(
                              postId: postId,
                            ))));
              },
              icon: const Icon(Icons.comment),
            ),
            // share button
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        Text(
          "${likes.length} likes",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        const Text(
          "View All 0 Comments",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
