import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edo_app/models/user.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  //collection reference
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');

  final StreamController<List<User>> _managerControler =
      StreamController<List<User>>.broadcast();

  Future createUserM(User user) async {
    try {
      await _userCollection.doc(user.id).set(user.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
