import 'package:chat_app/Features/Feed/screens/comment_screen.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/Features/Feed/screens/feed_screen.dart';
import 'package:chat_app/Features/auth/Sign%20up/email_and_password/view.dart';
import '../../Features/auth/sign_in/view.dart';

navigateToSignIn(context) {
  Navigator.pushNamed(context, SignInScreen.id);
}

navigateToSignup(context){
  Navigator.pushNamed(context, SignupScreen.id);
}

navigateToFeedScreen(context){
  Navigator.pushNamed(context, FeedScreen.id);
}

// navigateToProfileScreen(){
//   Navigator.pushNamed(context, routeName)
// }

navigateToCommentScreen(context){
  Navigator.pushNamed(context, CommentScreen.id);
}