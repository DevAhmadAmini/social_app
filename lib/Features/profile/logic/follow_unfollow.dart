import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/methods/showing_snackbar.dart';

class Profile {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // logic of following or unfollowing someone
  Future followOrUnfollowUser({userId, myId, List? followers,context}) async {
    try {
      if (!followers!.contains(myId)) {
        await _firestore.collection("users").doc(userId).update({
          "followers": FieldValue.arrayUnion([myId]),
        });
        await _firestore.collection("users").doc(myId).update({
          "following": FieldValue.arrayUnion([userId]),
        });
      } else {
        await _firestore.collection("users").doc(userId).update({
          "followers": FieldValue.arrayRemove([myId]),
        });
        await _firestore.collection("users").doc(myId).update({
          "following": FieldValue.arrayRemove([userId]),
        });
      }
    } catch (error) {
      // later use toast instead of snackBar
      showErrorSnackBar(context);
    }
  }
}
