import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/widgets/link-account-button.dart';

class AlternativeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void googleSignIn() {}

    void facebookSignIn() {}

    var GoogleButton = LinkAccountButton(
        click: googleSignIn,
        text: "google",
        icon: Image.asset("assets/images/google.png"));

    var FacebookButton = LinkAccountButton(
        click: facebookSignIn,
        text: "facebook",
        icon: Image.asset("assets/images/facebook.png"));

    return Container(
      margin: AppDimens.BUTTON_PADDING,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Or log in with", style: AppStyles.SMALL_HEADING_STYLE),
          SizedBox(height: AppDimens.LARGE_SPACER),
          GoogleButton,
          SizedBox(height: AppDimens.SMALL_SPACER),
          FacebookButton,
        ],
      ),
    );
  }
}
