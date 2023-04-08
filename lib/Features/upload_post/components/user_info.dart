import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user.dart' as model;
import '../../../utils/styles/text_styles.dart';
import '../view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserInfoWidget extends ConsumerWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   model.User user = ref.read(userProvider);
    return Row(
      children: [
         CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
          backgroundImage: CachedNetworkImageProvider(user.avatarUrl!),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                user.username!,
                style: kSimpleTextStyle,
              ),
             const SizedBox(height: 8),
             const Text(
                "16 May, 2023",
                style: kSmallGreyStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
