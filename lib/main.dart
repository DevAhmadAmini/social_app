import 'package:flutter/material.dart';

import 'package:chat_app/Features/auth/sign_in/view.dart';
import 'package:chat_app/Features/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Features/Feed/screens/comment_screen.dart';
import 'Features/Feed/screens/feed_screen.dart';
import 'Features/auth/Sign up/choose_login_type.dart';
import 'Features/auth/Sign up/email_and_password/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<dynamic>? handleLogin() {
    return _auth.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StreamBuilder(
        stream: handleLogin(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginTypeScreen();
          }
        },
      ),
      // home: const TimeagoText(),
      routes: {
        SignupScreen.id: (context) => const SignupScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        FeedScreen.id: (context) => const FeedScreen(),
        CommentScreen.id: (context) => const CommentScreen(postId: ""),
      },
    );
  }
}
