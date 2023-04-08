import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/cancel_button.dart';
import 'components/search_box.dart';
import 'components/user_tile.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});
  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _searchController = TextEditingController();
  bool isShowStream = false;
  int? numberOfUsers;
  var user;
  String? id;

  // The stream we use to get our specified snapshots
  Stream<QuerySnapshot<Map<String, dynamic>>> getStream() {
    return _firestore
        .collection("users")
        .where("username", isGreaterThanOrEqualTo: _searchController.text)
        .snapshots();
  }

  // triggers when text field is submitted
  void onTextFieldSubmitted(value) {
    isShowStream = true;
    setState(() {});
    getStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12),
              child: Row(
                children: [
                  SearchBoxWidget(
                    searchController: _searchController,
                    // This method triggers when the Search is done and submitted
                    onPressed: onTextFieldSubmitted,
                  ),
                  const CancelButton(),
                ],
              ),
            ),
            Expanded(
              // we use isShowStream bool to control when to perform the stream builder (textField is submitted)
              child: isShowStream == true
                  ? StreamBuilder(
                      stream: getStream(),
                      builder: (context, snapshot) {
                        if (snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text("No user found"),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        numberOfUsers = snapshot.data!.docs.length;
                        return ListView.builder(
                          itemCount: numberOfUsers,
                          itemBuilder: (context, index) {
                            user = snapshot.data!.docs[index];
                            id = user["id"];
                            return UserTile(
                              //think about it
                              id: user["id"],
                              text: user["username"],
                              avatarUrl: user["avatarUrl"],
                              onPressed: () {},
                            );
                           
                          },
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
