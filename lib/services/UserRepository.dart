import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum UserCondition {
  SessionIdle,
  SessionNotOpen,
  SessionOpen,
  SessionOpening,
}

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  UserCondition _condition = UserCondition.SessionIdle;
  GoogleSignIn _googleSignIn;

  UserRepository() {
    _auth = FirebaseAuth.instance;
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
    _googleSignIn = GoogleSignIn();
  }

  FirebaseUser get user => _user;

  set user(FirebaseUser value) {
    _user = value;
  }

  UserCondition get condition => _condition;

  set condition(UserCondition value) {
    _condition = value;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _condition = UserCondition.SessionOpening;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _condition = UserCondition.SessionNotOpen;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signWithGoogle() async {
    try {
      _condition = UserCondition.SessionOpening;
      notifyListeners();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      debugPrint(e);
      _condition = UserCondition.SessionNotOpen;
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    _condition = UserCondition.SessionNotOpen;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser user) async {
    if (user == null) {
      _condition = UserCondition.SessionNotOpen;
    } else {
      _user = user;
      _condition = UserCondition.SessionOpen;
    }
    notifyListeners();
  }
}
