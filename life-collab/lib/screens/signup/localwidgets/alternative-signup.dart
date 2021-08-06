import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/screens/no-group/no-group.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:life_collab/widgets/link-account-button.dart';
import 'package:provider/provider.dart';

class AlternativeSignup extends StatelessWidget {
  const AlternativeSignup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void googleLogIn() async {
      CurrentUser _currentUser =
          Provider.of<CurrentUser>(context, listen: false);

      try {
        String _returnString = await _currentUser.loginUserWithGoogle();
        if (_returnString == "success") {
          Navigator.popUntil(
              context, ModalRoute.withName('/')); // Pop all previous screens
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NoGroupScreen()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(_returnString), duration: Duration(seconds: 2)));
        }
      } catch (e) {
        print(e);
      }
    }

    void facebookLogIn() async {
      CurrentUser _currentUser =
          Provider.of<CurrentUser>(context, listen: false);

      try {
        String _returnString = await _currentUser.loginUserWithFacebook();
        if (_returnString == "success") {
          Navigator.popUntil(
              context, ModalRoute.withName('/')); // Pop all previous screens
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NoGroupScreen()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(_returnString), duration: Duration(seconds: 2)));
        }
      } catch (e) {
        print(e);
      }
    }

    var GoogleButton = LinkAccountButton(
        click: googleLogIn,
        text: "google",
        icon: Image.asset("assets/images/google.png"));

    var FacebookButton = LinkAccountButton(
        click: facebookLogIn,
        text: "facebook",
        icon: Image.asset("assets/images/facebook.png"));

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Or sign up with", style: AppStyles.SMALL_HEADING_STYLE),
          SizedBox(height: AppDimens.LARGE_SPACER),
          GoogleButton,
          SizedBox(height: AppDimens.SMALL_SPACER),
          FacebookButton,
        ],
      ),
    );
  }
}
