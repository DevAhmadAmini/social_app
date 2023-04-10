import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// stream provider for post data using querySnapshots
 final postStreamProvider = StreamProvider.autoDispose((ref) {
    return FirebaseFirestore.instance.collection("posts").snapshots();
  });