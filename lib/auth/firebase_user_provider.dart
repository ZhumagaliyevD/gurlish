import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SocialBeautyPlatformFirebaseUser {
  SocialBeautyPlatformFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SocialBeautyPlatformFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SocialBeautyPlatformFirebaseUser>
    socialBeautyPlatformFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SocialBeautyPlatformFirebaseUser>(
            (user) => currentUser = SocialBeautyPlatformFirebaseUser(user));
