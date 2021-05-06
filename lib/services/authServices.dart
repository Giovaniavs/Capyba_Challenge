import 'package:capyba_challenge/services/database.dart';
import 'package:capyba_challenge/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future getCurrentUID() async {
    try {
      final existUser = await _auth.currentUser();

      return _userFromFirebaseUser(existUser);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser userFromResult = result.user;

      return _userFromFirebaseUser(userFromResult);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser newUser = result.user;

      await DatabaseService(uid: newUser.uid).handleUserData(name, email);

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
