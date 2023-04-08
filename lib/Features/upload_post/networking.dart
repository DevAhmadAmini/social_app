import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class Post {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // generating a unique random postId
  String postId = const Uuid().v1();

  // Adding image taken in upload post screen to storage
  Future<String> addPostImageToStorage(file) async {
    Reference reference =
        _storage.ref().child("postImages").child(_auth.currentUser!.uid);
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // Adding post Data to cloud Firestore
  Future addPostDataToFirestore({
    String? avatarUrl,
    String? photoUrl,
    String? id,
    required String text,
    String? username,
    required DateTime datePublished,
  }) async {
    await _firestore.collection("posts").doc(postId).set({
      "avatarUrl": avatarUrl,
      "photoUrl": photoUrl,
      "id": id,
      "postId": postId,
      "username": username,
      "text": text,
      "datePublished": datePublished,
      "likes": [],
    });
  }

}
