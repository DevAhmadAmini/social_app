import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Comments {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // generating comment Id
  String commentId = const Uuid().v1();

  // adding comment Data to firestore
  Future addCommentDataToFirestore({
    String? postId,
    String? username,
    String? avatarUrl,
    String? commentText,
    DateTime? dateTime,
  }) async {
    await _firestore.collection("comments").doc(commentId).set({
      "username": username,
      "postId": postId,
      "avatarUrl": avatarUrl,
      "commentText": commentText,
      "datePublished": dateTime,
    });
  }
}
