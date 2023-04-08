import 'package:chat_app/utils/methods/showing_snackbar.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/manage_state/user_info/user_notifier.dart';
import 'package:chat_app/models/user.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../../utils/methods/navigators.dart';
import 'components/erase_button.dart';
import 'components/pick_image_buttons.dart';
import 'components/post_button.dart';
import 'components/post_text_field.dart';
import 'package:chat_app/Features/upload_post/networking.dart';
import '../upload_post/components/user_info.dart';

// we just create our stateNotifierProvider (user) here
final userProvider = StateNotifierProvider<UserNotifier, model.User>(
  (ref) => UserNotifier(
    model.User(),
  ),
);

class UploadPost extends StatefulWidget {
  const UploadPost({super.key});
  @override
  State<UploadPost> createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  final TextEditingController _postController = TextEditingController();
  DateTime currentDate = DateTime.now();
  model.User? user;
  Post post = Post();
  String? password;
  File? image;

  void postingToFirebase() async {
    try {
      // add Image to Storage and save it to photoUrl
      String photoUrl = await post.addPostImageToStorage(image);
      // add data to cloud firestore
      await post.addPostDataToFirestore(
        avatarUrl: user!.avatarUrl,
        photoUrl: photoUrl,
        id: user!.id,
        text: _postController.text,
        username: user!.username,
        datePublished: currentDate,
      );
      // Try finding a better way of doing it 
      navigateToFeedScreen(context);
    } catch (error) {
      showErrorSnackBar(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _postController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // then we just read user provider
        user = ref.read(userProvider);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 3,
            // cancel everything and navigate back
            leading: EraseButton(
              onPressed: () {},
            ),
            actions: [
              PostButton(
                // we post to firebase
                onPost: postingToFirebase,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 17,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // circle avatar, username and time display here
                  const UserInfoWidget(),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 6),
                    // where we write our post
                    child: PostTextField(
                      postController: _postController,
                    ),
                  ),
                  image != null
                      ? Image.file(
                          image!,
                          height: 180,
                          width: MediaQuery.of(context).size.width * 0.86,
                        )
                      : const SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 5,
                      top: image != null ? 22 : 180,
                    ),
                    child: Row(
                      // we take picture using these two buttons
                      children: [
                        CameraImageWidget(
                          // used callBack to get file form child widget
                          onPressed: (file) {
                            image = file;
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 15),
                        GalleryImageWidget(
                          // used callBack to get file form child widget
                          onPressed: (file) {
                            image = file;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
