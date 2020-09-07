import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:inkpool/utils/common.dart';

class Database {
  login(String username, String password) async {
    final result = await Firestore.instance
        .collection('Inkpool')
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .getDocuments();
    print(result.documents.isEmpty);
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

  getRanking(String round) {
    return Firestore.instance
        .collection('Inkpool')
        .where('round', isEqualTo: int.parse(round))
        .orderBy('totalscore', descending: true)
        .snapshots();
  }

  getRound() {
    return Firestore.instance.collection('round').document('round').snapshots();
  }

  getPoolRanking(int poolno) {
    return Firestore.instance
        .collection('Inkpool')
        .where('round', isEqualTo: 2)
        .where('poolno', isEqualTo: poolno)
        .snapshots();
  }
}
