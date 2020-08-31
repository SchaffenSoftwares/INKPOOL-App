import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inkpool/utils/common.dart';

class Database {
  login(String username, String password) async {
    final result = await Firestore.instance
        .collection('Inkpool')
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .getDocuments();
    return result.documents.isEmpty;
  }

  getUser() {
    return Firestore.instance
        .collection('Inkpool')
        .document(username)
        .snapshots();
  }

  submitRound1(Map<String, dynamic> data) {
    Firestore.instance
        .collection('Inkpool')
        .document(username)
        .setData(data, merge: true);
  }
}
