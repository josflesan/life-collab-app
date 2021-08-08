import 'package:flutter/material.dart';
import 'package:life_collab/screens/landing/landing.dart';
import 'package:life_collab/screens/no-group/no-group.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}

class OurRoot extends StatefulWidget {
  const OurRoot({Key key}) : super(key: key);

  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    // Get the state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartUp();

    // Check current user
    if (_returnString == "success") {
      setState(() {
        // Set AuthStatus based on state
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = OurLanding();
        break;

      case AuthStatus.loggedIn:
        retVal = NoGroupScreen();
        break;

      default:
    }

    return retVal;
  }
}
