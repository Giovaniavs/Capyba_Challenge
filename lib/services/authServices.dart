import 'package:capyba_challenge/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:capyba_challenge/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future getUserInformations() async {
    try {
      final user = await _auth.currentUser();

      dynamic result =
          Firestore.instance.collection('User').document(user.uid).get();

      return result;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future sendVerification() async {
    try {
      final user = await _auth.currentUser();

      return user.sendEmailVerification();
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
