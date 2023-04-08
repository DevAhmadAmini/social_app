import 'package:chat_app/Features/auth/Sign%20up/email_and_password/sections/page_text_fields.dart';
import 'package:chat_app/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Registration {
  final FirebaseAuth _register = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Registered User to firebase with email and password

  Future<void> registerUser() async {
    await _register.createUserWithEmailAndPassword(
      email: SignupTextFields.email!,
      password: SignupTextFields.password!,
    );
  }

  // Added photo(file) to storage

  Future<String> addAvatarToStorage(file) async {
    if (file == null) {
      throw Exception("File can not be null");
    }
    Reference ref =
        _storage.ref().child("users avatar").child(_register.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // Added User Data to firestore when registration

  Future<void> addUserDataToFirestore({
    // the photoUrl we use here is coming from storage
    required String avatarUrl,
  }) async {
    // We just add our data to user model.
    // In this way we have always access to user data
    model.User user = model.User(
      email: SignupTextFields.email,
      password: SignupTextFields.password,
      username: SignupTextFields.username,
      bio: SignupTextFields.bio,
      id: _register.currentUser!.uid,
      followers: [],
      following: [],
      avatarUrl: avatarUrl,
    );
    // now we add the data inside model to firestore using toJson method.
    await _firestore.collection("users").doc(_register.currentUser!.uid).set(
          user.toJson(),
        );
  }
}
