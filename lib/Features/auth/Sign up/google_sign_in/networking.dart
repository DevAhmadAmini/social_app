import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future<void> loginWithGoogleAccount() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
  }

  Future<void> addGoogleAccountDataToFirestore() async {
    _firestore.collection("users").doc(_auth.currentUser!.uid).set({
      "email": _auth.currentUser!.email,
      "id": _auth.currentUser!.uid,
      "username": _auth.currentUser!.displayName,
      "avatarUrl": _auth.currentUser!.photoURL,
      "following": [],
      "followers": [],
      "bio": "",
      "password": "",
    });
  }
}
