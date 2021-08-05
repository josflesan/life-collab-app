import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/screens/login/login.dart';
import 'package:life_collab/screens/signup/signup.dart';
import 'package:life_collab/widgets/primary-button.dart';
import 'package:life_collab/widgets/text-button.dart';

class OurLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void navigateLogin() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OurLogin()));
    }

    void navigateSignup() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OurSignUp()));
    }

    return Scaffold(
      body: Padding(
        padding: AppDimens.SCREEN_PADDING_LARGE,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Your Life.", style: AppStyles.TITLE_STYLE_BLACK),
                    SizedBox(width: 9.0),
                    Text("Cleaner", style: AppStyles.TITLE_STYLE_GREEN),
                  ]),
                  SizedBox(height: 13.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bring clarity to your household",
                          style: AppStyles.SUBTITLE_STYLE)
                    ],
                  ),
                  Image.asset("assets/images/landing-graphic.png"),
                  SizedBox(height: 13.0),
                  OurPrimaryButton(
                      click: navigateLogin,
                      text: "Login",
                      color: AppColors.PRIMARY_GREEN),
                  OurTextButton(
                    click: navigateSignup,
                    text: "Sign Up",
                    color: AppColors.APP_BLACK,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
