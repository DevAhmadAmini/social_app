import 'package:chat_app/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> updateUser() async {
    print("I am Eren Yeager");
    String currentId = _auth.currentUser!.uid;
    // getting the current user's info from firestore
    DocumentSnapshot snapshot =
        await _firestore.collection("users").doc(currentId).get();
    // returning user model with the newest data
    return model.User(
      email: snapshot["email"],
      // password: snapshot["password"],
      username: snapshot["username"],
      // bio: snapshot["bio"],
      id: snapshot["id"],
      followers: snapshot["followers"],
      following: snapshot["following"],
      avatarUrl: snapshot["avatarUrl"],
    );
  }
}
