import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(
      String email, String password, BuildContext context) async {
    bool retVal = false;

    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (_authResult.user != null) {
        retVal = true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("This email is already registered. Please try logging in"),
            duration: Duration(seconds: 2)));
      }
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<bool> loginUser(
      String email, String password, BuildContext context) async {
    bool retVal = false;

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (_authResult.user != null) {
        _uid = _authResult.user.uid;
        _email = _authResult.user.email;
        retVal = true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Incorrect Login"), duration: Duration(seconds: 2)));
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("User Does Not Exist"),
            duration: Duration(seconds: 2)));
      }
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
