import 'dart:io';

import 'package:capyba_challenge/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      String name = '';
      String email = '';
      String photo = '';
      List listOfUserInformations = [];

      dynamic userInformations =
          await Firestore.instance.collection('User').document(user.uid).get();

      name = userInformations.data['nome'];
      email = userInformations.data['email'];
      photo = userInformations.data['photo'];

      listOfUserInformations.addAll({name, email, photo, user.isEmailVerified});

      return listOfUserInformations;
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

  Future updateUserInformations(
    String name,
    String email,
    File imageFile,
  ) async {
    try {
      final user = await _auth.currentUser();

      await user.updateEmail(email);

      dynamic imageFileUrl = await uploadImageFromFile(email, imageFile);

      await DatabaseService(uid: user.uid)
          .handleUserData(name, email, imageFileUrl);

      return true;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future updateUserInformationsFromImageUrl(
    String name,
    String email,
    String imageUrl,
  ) async {
    try {
      final user = await _auth.currentUser();

      await user.updateEmail(email);

      await DatabaseService(uid: user.uid)
          .handleUserData(name, email, imageUrl);

      return _userFromFirebaseUser(user);
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
    String name,
    String email,
    String password,
    File imageFile,
  ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      FirebaseUser newUser = result.user;

      dynamic imageFileUrl = await uploadImageFromFile(email, imageFile);

      await DatabaseService(uid: newUser.uid)
          .handleUserData(name, email, imageFileUrl);

      return _userFromFirebaseUser(newUser);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future uploadImageFromFile(String email, File imageFile) async {
    try {
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('userPhotos/user-$email');

      StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageFile);

      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

      String imageFileUrl = await taskSnapshot.ref.getDownloadURL();

      return imageFileUrl;
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
