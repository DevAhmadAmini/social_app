import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../utils/widgets/vertical_line.dart';
import '../profile_info_components/round_button.dart';
import '../profile_info_components/user_info.dart';
import '../profile_info_components/user_statistics.dart';

class MyProfileInfo extends StatelessWidget {
  final DocumentSnapshot<Map<String, dynamic>> data;
  const MyProfileInfo({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // User's Avatar
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(
              data["avatarUrl"],
            ),
          ),
          const SizedBox(height: 16),
          // It Includes username, bio and location
          UserPersonalInfo(
            username: data["username"] ?? "",
            bio: data["bio"] ?? "",
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
                number: data["following"].length,
              ),
              const VerticalLineWidget(),
              UserStatisticsWidget(
                text: "Followers",
                number: data["followers"].length,
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
  }
}
