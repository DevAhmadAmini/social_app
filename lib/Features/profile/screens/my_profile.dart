// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:chat_app/Features/profile/components/my_profile/my_profile_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../manage_state/stream providers/user_provider.dart';
import '../../upload_post/view.dart';


class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This is our first page when the user enters so we use refresh user method here to get user's info and put it inside the model the moment user opens the app
    ref.watch(userProvider.notifier).refreshUser();
    // using stream provider of flutter riverpod to display the data
    return ref.watch(userStreamProvider).when(
      data: (data) {
        return MyProfileInfo(
          data: data,
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text("Something went wrong"),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
