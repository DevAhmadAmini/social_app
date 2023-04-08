// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/widgets/vertical_line.dart';
import '../../upload_post/view.dart';
import '../components/round_button.dart';
import '../components/user_info.dart';
import '../components/user_statistics.dart';

// final userStreamProvider = StreamProvider.autoDispose((ref) {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   return FirebaseFirestore.instance
//       .collection("users")
//       .doc(_auth.currentUser!.uid)
//       .snapshots();
// });

class MyProfileScreen extends ConsumerWidget {
  MyProfileScreen({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var myProfileInfo;

  Stream<DocumentSnapshot> myStream() {
    return _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This is our first page when the user enters so we use refresh user method here to get user's info and put it inside the model the moment user opens the app
    ref.watch(userProvider.notifier).refreshUser();
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: myStream(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // we just put all current user's data to myProfileInfo
              myProfileInfo = snapshot.data!.data();
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // User's Avatar
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      backgroundImage: CachedNetworkImageProvider(
                        myProfileInfo["avatarUrl"],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // send userInfo to this child widget (username,bio,location)
                    ProfileInfoWidget(
                      username: myProfileInfo["username"] ?? "",
                      bio: myProfileInfo["bio"] ?? "",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 33, bottom: 26),
                      // Edit Profile Button
                      child: ProfileRoundButton(
                        text: "Edit Profile",
                        onPressed: () {},
                      ),
                    ),
                    // The number of following / followers and posts display here
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UserStatisticsWidget(
                          text: "Following",
                          number: myProfileInfo["following"].length,
                        ),
                        const VerticalLineWidget(),
                        UserStatisticsWidget(
                          text: "Followers",
                          number: myProfileInfo["followers"].length,
                          // number: 0,
                        ),
                        const VerticalLineWidget(),
                        const UserStatisticsWidget(
                          text: "posts",
                          number: 0,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
