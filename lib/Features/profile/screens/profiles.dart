import 'package:flutter/material.dart';

import 'package:chat_app/Features/profile/logic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/round_button.dart';
import '../components/user_info.dart';
import '../components/user_statistics.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../utils/widgets/vertical_line.dart';

class UserProfileScreen extends StatefulWidget {
  static String id = "profile-screen";
  // the id of the we get from other pages
  final String? uid;
  const UserProfileScreen({super.key, this.uid});
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List? following;
  List? followers;
  String? username;
  String? bio;
  // userInfo is all userData we get form firestore
  var userInfo;

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
              userInfo = snapshot.data!.data();
              username = userInfo["username"];
              bio = userInfo["bio"];
              following = userInfo["following"];
              followers = userInfo["followers"];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // User's Avatar
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    backgroundImage: CachedNetworkImageProvider(
                      userInfo!["avatarUrl"],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // profile username, bio and location displays here
                  ProfileInfoWidget(
                    username: username!,
                    bio: bio!,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 33, bottom: 26),
                    // The Button we use for Following / unfollowing

                    // if the id we get from other pages(search,feed) is equal to current id (it is our own profile) we show edit profile and if not (other users profiles) we show follow / unfollow buttons
                    child: widget.uid == _auth.currentUser!.uid
                        ? ProfileRoundButton(
                            text: "Edit Profile",
                            onPressed: () {},
                          )
                        : followers!.contains(_auth.currentUser!.uid)
                            ? ProfileRoundButton(
                                text: "UnFollow",
                                onPressed: () {
                                  Profile().followOrUnfollowUser(
                                    widget.uid,
                                    _auth.currentUser!.uid,
                                    followers!,
                                    context,
                                  );
                                },
                              )
                            : ProfileRoundButton(
                                text: "Follow",
                                onPressed: () {
                                  Profile().followOrUnfollowUser(
                                    widget.uid,
                                    _auth.currentUser!.uid,
                                    followers!,
                                    context,
                                  );
                                },
                              ),
                  ),
                  // The number of following / followers and posts display here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserStatisticsWidget(
                        text: "Following",
                        number: following!.length,
                      ),
                      const VerticalLineWidget(),
                      UserStatisticsWidget(
                        text: "Followers",
                        number: followers!.length,
                      ),
                      const VerticalLineWidget(),
                      const UserStatisticsWidget(
                        text: "posts",
                        number: 0,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
