import 'package:brewcrew/modules/brew.dart';
import 'package:brewcrew/modules/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String uid;

  DatabaseService({this.uid});

  //brew List From Snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        sugars: doc.data['sugars'] ?? '0',
        strength: doc.data['strength'] ?? 0
      );
    }).toList();
  }

  UserData _userDataFromSnapShot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'] ?? '',
      sugars: snapshot.data['sugars'] ?? '0',
      strength: snapshot.data['strength'] ?? 0
    );
  }

  // Collection Reference
  final CollectionReference _brewCollection = Firestore.instance.collection('brews');

  // Get Brews Stream
  Stream<List<Brew>> get brews {
    return _brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //brew for user
  Stream<UserData> get userData{
    return _brewCollection.document(uid).snapshots().map(_userDataFromSnapShot);
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