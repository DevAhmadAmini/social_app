import 'package:firebase_auth/firebase_auth.dart';

import 'sections/text_fields.dart';

class Login {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signingIn() async {
    await _auth.signInWithEmailAndPassword(
      email: SignInTextFields.email!,
      password: SignInTextFields.password!,
    );
  }
}
