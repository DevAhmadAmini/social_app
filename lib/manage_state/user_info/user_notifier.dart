import 'package:chat_app/manage_state/user_info/update_user.dart';
import 'package:chat_app/models/user.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// We used stateNotifier to manage our state

class UserNotifier extends StateNotifier<model.User> {
  UserNotifier(super._state);
 Future refreshUser() async {
  // with update user method we just get the current users info and put it inside user
    model.User user = await UpdateUser().updateUser();
    // then transform it to state so we can use it anywhere
    state = user;
  }
}
