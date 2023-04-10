import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../manage_state/stream providers/post_provider.dart';
import '../components/post_tile.dart';

class FeedScreen extends StatefulWidget {
  static String id = "feed-screen";
  const FeedScreen({super.key});
  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Map<String, dynamic>? postInfo;
  int? numberOfPosts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Consumer(
          builder: (context, ref, child) {
            return ref.watch(postStreamProvider).when(
                  data: (data) {
                    numberOfPosts = data.docs.length;
                    return ListView.builder(
                      itemCount: numberOfPosts,
                      itemBuilder: (context, index) {
                        postInfo = data.docs[index].data();
                        Timestamp timestamp = data.docs[index]["datePublished"];
                        // using timeago package to get time of published
                        String publishTime = timeago.format(timestamp.toDate());
                        return PostTile(
                          postInfo: postInfo,
                          datePublished: publishTime,
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) => const Center(
                    child: Text("something went wrong"),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
          },
        ),
      ),
    );
  }
}
