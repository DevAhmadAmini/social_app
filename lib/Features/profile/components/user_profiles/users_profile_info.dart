import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../utils/widgets/vertical_line.dart';
import '../../logic/follow_unfollow.dart';
import '../profile_info_components/round_button.dart';
import '../profile_info_components/user_info.dart';
import '../profile_info_components/user_statistics.dart';

class UsersProfileInfo extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Map<String, dynamic> userInfo;
  final String id;
  UsersProfileInfo({
    super.key,
    required this.userInfo,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // User's Avatar
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: CachedNetworkImageProvider(
            userInfo["avatarUrl"],
          ),
        ),
        const SizedBox(height: 16),
        // profile username, bio and location displays here
        UserPersonalInfo(
          username: userInfo["username"],
          bio: userInfo["bio"]!,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 33, bottom: 26),
          // The Button we use for Following / unfollowing

          // if the id we get from other pages(search,feed) is equal to current id (it is our own profile) we show edit profile and if not (other users profiles) we show follow / unfollow buttons
          child: id == _auth.currentUser!.uid
              ? ProfileRoundButton(
                  text: "Edit Profile",
                  onPressed: () {},
                )
                // if we already followed him remove it 
              : userInfo["followers"]!.contains(_auth.currentUser!.uid)
                  ? ProfileRoundButton(
                      text: "UnFollow",
                      onPressed: () {
                        Profile().followOrUnfollowUser(
                          userId: id,
                          myId: _auth.currentUser!.uid,
                          followers: userInfo["followers"]!,
                          context: context,
                        );
                      },
                    )
                    // if not then follow him
                  : ProfileRoundButton(
                      text: "Follow",
                      onPressed: () {
                        Profile().followOrUnfollowUser(
                          userId: id,
                          myId: _auth.currentUser!.uid,
                          followers: userInfo["followers"]!,
                          context: context,
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
              number: userInfo["following"]!.length,
            ),
            const VerticalLineWidget(),
            UserStatisticsWidget(
              text: "Followers",
              number: userInfo["followers"]!.length,
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
  }
}
