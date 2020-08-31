import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  login(String username, String password) async {
    final result = await Firestore.instance
        .collection('Inkpool')
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .getDocuments();
    return result.documents.isEmpty;
  }
}
