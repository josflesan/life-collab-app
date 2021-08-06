import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/widgets/link-account-button.dart';

class AlternativeSignup extends StatelessWidget {
  const AlternativeSignup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void googleLogIn() {}

    void facebookLogIn() {}

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
