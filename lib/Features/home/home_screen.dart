import 'package:flutter/material.dart';

import 'package:chat_app/Features/Feed/screens/feed_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/logout.dart';
import '../profile/screens/my_profile.dart';
import '../search_user/view.dart';
import '../upload_post/view.dart';
import 'components/navigation_bar.dart' as component;

class HomeScreen extends StatefulWidget {
  static String id = "home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  FirebaseAuth auth = FirebaseAuth.instance;

  // we put the index into currentIndex to navigate between pages and bars
  void onTap(index) {
    currentIndex = index;
    setState(() {});
  }

  // list of screens
  final screens = [
    MyProfileScreen(),
    const FeedScreen(),
    const SearchUserScreen(),
    const UploadPost(),
    const LogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Screens
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        // Bottom Bars
        items: component.NavigationBar().bars,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
