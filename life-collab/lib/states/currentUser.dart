import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(
      String email, String password, BuildContext context) async {
    String retVal = "error";

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      retVal = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("This email is already registered. Please try logging in"),
            duration: Duration(seconds: 2)));
      }
    } catch (e) {
      retVal = e.message;
    }

    return retVal;
  }

  Future<String> loginUserWithEmail(
      String email, String password, BuildContext context) async {
    String retVal = "error";

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _uid = _authResult.user.uid;
      _email = _authResult.user.email;
      retVal = "success";
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
      retVal = e.message;
    }

    return retVal;
  }

  Future<String> loginUserWithGoogle() async {
    String retVal = "error";

    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      final UserCredential _authResult =
          await _auth.signInWithCredential(credential);

      _uid = _authResult.user.uid;
      _email = _authResult.user.email;
      retVal = "success";
    } catch (e) {
      retVal = e.message;
    }

    return retVal;
  }
}
