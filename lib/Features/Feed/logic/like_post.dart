import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Like {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // The postUid we use for liking and commenting is coming from postTile
  // in this way flutter understand which post we clicked and give us the clicked postId


   // if currentId user is inside list of likes remove it else add it
  Future<void> likePost(List likes, postUid) async {
    if (!likes.contains(_auth.currentUser!.uid)) {
      await _firestore.collection("posts").doc(postUid).update({
        "likes": FieldValue.arrayUnion([_auth.currentUser!.uid]),
      });
    } else {
      await _firestore.collection("posts").doc(postUid).update({
        "likes": FieldValue.arrayRemove([_auth.currentUser!.uid]),
      });
    }
  }
}
