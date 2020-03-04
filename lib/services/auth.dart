import 'package:brewcrew/modules/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create User obj
  User _createUserFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // sign anom
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _createUserFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign with email

  // register

  // sigout 

}