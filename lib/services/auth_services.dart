import 'package:capyba_challenge/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<String> get onAuthStateChanged => _auth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );

  Future<String> getCurrentUID() async {
    final existUser = await _auth.currentUser();
    if (existUser != null) {
      return existUser.uid;
    } else {
      return null;
    }
  }

  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser newUser = result.user;

      return _userFromFirebaseUser(newUser);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
