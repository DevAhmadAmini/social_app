import 'package:flutter/material.dart';

class NavigationBar {

  final bars = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Feed",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.upload),
      label: "Post",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "logout",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: "Profile",
    ),
  ];
}
