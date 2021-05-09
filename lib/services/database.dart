import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('User');

  Future handleUserData(
    String name,
    String email,
    String photoUrl,
  ) async {
    return await userCollection
        .document(uid)
        .setData({'nome': name, 'email': email, 'photo': photoUrl});
  }
}
