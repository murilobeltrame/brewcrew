import 'package:brewcrew/modules/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create User obj
  User _createUserFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_createUserFromFirebase);
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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult _result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser _user = _result.user;
      return _createUserFromFirebase(_user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult _result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser _user = _result.user;
      return _createUserFromFirebase(_user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sigout 
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}