import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class GurlishFirebaseUser {
  GurlishFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

GurlishFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GurlishFirebaseUser> gurlishFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<GurlishFirebaseUser>(
      (user) {
        currentUser = GurlishFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
