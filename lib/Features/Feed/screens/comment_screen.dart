import 'package:chat_app/Features/Feed/logic/add_comment.dart';
import 'package:chat_app/Features/upload_post/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../components/comment_components/add_comment_box.dart';
import '../components/comment_tile.dart';

class CommentScreen extends StatefulWidget {
  static String id = "comment-screen";
  final String postId;
  const CommentScreen({super.key, required this.postId});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DateTime currentTime = DateTime.now();

  Stream<QuerySnapshot> getStream() {
    return _firestore
        .collection("comments")
        .where("postId", isEqualTo: widget.postId)
        .snapshots();
  }

  Future<void> postComment(username, avatarUrl) async {
    await Comments().addCommentDataToFirestore(
      // username and avatarUrl is currentUser's data which we get from our statemanagment
      username: username,
      avatarUrl: avatarUrl,
      // taken from text Field
      commentText: _commentController.text,
      // postId is the id of the post that we clicked
      postId: widget.postId,
      dateTime: currentTime,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // userProvider from stateNotifier (StateManagment)
        User user = ref.read(userProvider);
        String? avatarUrl = user.avatarUrl;
        return Scaffold(
          bottomNavigationBar: AddCommentBox(
            commentController: _commentController,
            avatarUrl: avatarUrl!,
            // adding comment data to firestore
            onPressed: () async {
              await postComment(user.username, user.avatarUrl);
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: StreamBuilder<QuerySnapshot>(
              stream: getStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                // condition for no data (maybe null)
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // condition for no comment
                else if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No Comments"),
                  );
                }
                int commentNumbers = snapshot.data!.docs.length;
                return ListView.builder(
                  itemCount: commentNumbers,
                  itemBuilder: (context, index) {
                    // All comment Data We have
                    var commentInfo = snapshot.data!.docs[index].data();
                    // getting comment Date published and put it inside timestamp var
                    Timestamp timestamp =
                        snapshot.data!.docs[index]["datePublished"];
                    // changing it to dateTime
                    DateTime dateTime = timestamp.toDate();
                    // getting correct time using timeago package
                    String publishTime = timeago.format(dateTime);
                    return CommentTile(
                      commentInfo: commentInfo!,
                      commentDatePublished: publishTime,
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
