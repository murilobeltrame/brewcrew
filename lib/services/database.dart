import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String uid;

  DatabaseService({this.uid});

  // Collection Reference
  final CollectionReference _brewCollection = Firestore.instance.collection('brews');

  // Get Brews Stream
  Stream<QuerySnapshot> get brews {
    return _brewCollection.snapshots();
  }

  // 
  Future updateUserData(String sugars, String name, int strength) async {
    return await _brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

}