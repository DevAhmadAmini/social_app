import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/user_profiles/users_profile_info.dart';

class UserProfileScreen extends StatefulWidget {
  static String id = "profile-screen";
  // the id of doc that we get from other pages
  final String? uid;
  const UserProfileScreen({super.key, this.uid});
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<DocumentSnapshot> getStream() {
    return _firestore
        .collection("users")
        // we get user's data based on id we get back from other pages means based on which profile user taps
        .doc(widget.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
        child: SafeArea(
          // Using stream builder to get user data back form firestore (document snapshot)
          child: StreamBuilder<DocumentSnapshot>(
            stream: getStream(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              //we put the data which is a single Map<String,dynamic> of user data inside userInfo and then can send it to all child Widgets
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // putting all data to userInfo var
              Map<String, dynamic>? userInfo =
                  snapshot.data!.data() as Map<String, dynamic>?;
                  // we used cast because userInfo is an object not map 
              return UsersProfileInfo(
                userInfo: userInfo!,
                id: widget.uid!,
              );
            },
          ),
        ),
      ),
    );
  }
}
