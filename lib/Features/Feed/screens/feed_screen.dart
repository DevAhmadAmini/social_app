import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:chat_app/Features/Feed/components/post_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FeedScreen extends StatefulWidget {
  static String id = "feed-screen";
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? postInfo;
  int? numberOfPosts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: StreamBuilder(
          stream: _firestore.collection("posts").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            numberOfPosts = snapshot.data!.docs.length;
            return ListView.builder(
              itemCount: numberOfPosts,
              itemBuilder: (context, index) {
                // we get all post data
                postInfo = snapshot.data!.docs[index].data();
                // changing timestamp to actual date
                DateTime dateTime = postInfo!["datePublished"].toDate();
                // using timeago package to get time of published
                String publishTime = timeago.format(dateTime);
                return PostTile(
                  postInfo: postInfo,
                  datePublished: publishTime,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
