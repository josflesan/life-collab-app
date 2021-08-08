import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import 'package:life_collab/models/user.dart';
import 'package:life_collab/services/database.dart';

class CurrentUser extends ChangeNotifier {
  OurUser _currentUser = OurUser();

  OurUser get getCurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = "error";

    try {
      User _firebaseUser = await _auth.currentUser;
      if (_firebaseUser != null) {
        _currentUser.uid = _firebaseUser.uid;
        _currentUser.email = _firebaseUser.email;
        retVal = "success";
      }
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signOut() async {
    String retVal = "error";

    try {
      await _auth.signOut();
      _currentUser = OurUser();
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signUpUser(String email, String password, String fullName,
      BuildContext context) async {
    String retVal = "error";

    OurUser _user = OurUser();

    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResult.user.uid;
      _user.email = _authResult.user.email;
      _user.fullName = fullName;
      String _returnString = await OurDatabase().createUser(_user);
      if (_returnString == "success") {
        retVal = "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("This email is already registered. Please try logging in"),
            duration: Duration(seconds: 2)));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("The email is invalid."),
            duration: Duration(seconds: 2)));
      }
      print(e.code);
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

      _currentUser.uid = _authResult.user.uid;
      _currentUser.email = _authResult.user.email;
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

    OurUser _user = OurUser();

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      final UserCredential _authResult =
          await _auth.signInWithCredential(credential);

      if (_authResult.additionalUserInfo.isNewUser) {
        _user.uid = _authResult.user.uid;
        _user.email = _authResult.user.email;
        _user.fullName = _authResult.user.displayName;
        OurDatabase().createUser(_user);
      }
      retVal = "success";
    } catch (e) {
      retVal = e.message;
    }

    return retVal;
  }

  Future<String> loginUserWithFacebook() async {
    String retVal = "error";

    OurUser _user = OurUser();

    try {
      final LoginResult result = await FacebookAuth.instance.login(
          permissions: const ['email', 'public_profile'],
          loginBehavior: LoginBehavior.dialogOnly);

      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken.token);

          final _authResult =
              await _auth.signInWithCredential(facebookCredential);

          if (_authResult.additionalUserInfo.isNewUser) {
            _user.uid = _authResult.user.uid;
            _user.email = _authResult.user.email;
            _user.fullName = _authResult.user.displayName;
            OurDatabase().createUser(_user);
          }

          retVal = "success";
          break;

        case LoginStatus.cancelled:
          retVal = "cancelled";
          break;

        case LoginStatus.failed:
          retVal = "error";
          break;

        default:
          retVal = "error";
          break;
      }
    } catch (e) {
      print(e.message);
      retVal = e.message;
    }

    return retVal;
  }
}
