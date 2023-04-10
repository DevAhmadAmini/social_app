import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Stream provider for user data using document snapshot
final userStreamProvider = StreamProvider.autoDispose((ref) {
  final FirebaseAuth auth = FirebaseAuth.instance;
  return FirebaseFirestore.instance
      .collection("users")
      .doc(auth.currentUser!.uid)
      .snapshots();
});

