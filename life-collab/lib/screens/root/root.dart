import 'package:flutter/material.dart';
import 'package:life_collab/screens/landing/landing.dart';
import 'package:life_collab/screens/loadingScreen/loadingScreen.dart';
import 'package:life_collab/screens/no-group/no-group.dart';
import 'package:life_collab/screens/tab-view/tabview.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:provider/provider.dart';

enum AuthStatus { unknown, notLoggedIn, notInGroup, inGroup }

class OurRoot extends StatefulWidget {
  const OurRoot({Key key}) : super(key: key);

  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    // Get the state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartUp();

    // Check current user
    if (_returnString == "success") {
      if (_currentUser.getCurrentUser.groupId != null) {
        setState(() {
          // Set AuthStatus based on state
          _authStatus = AuthStatus.inGroup;
        });
      } else {
        setState(() {
          // Set AuthStatus based on state
          _authStatus = AuthStatus.notInGroup;
        });
      }
    } else {
      setState(() {
        // Set AuthStatus based on state
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.unknown:
        retVal = OurLoadingScreen();
        break;

      case AuthStatus.notInGroup:
        retVal = NoGroupScreen();
        break;

      case AuthStatus.inGroup:
        retVal = OurTabView();
        break;

      case AuthStatus.notLoggedIn:
        retVal = OurLanding();
        break;

      default:
    }

    return retVal;
  }
}
