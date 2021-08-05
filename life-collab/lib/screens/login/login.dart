import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/screens/login/localwidgets/alternative-login.dart';
import 'package:life_collab/screens/login/localwidgets/login-form.dart';
import 'package:life_collab/screens/signup/signup.dart';
import 'package:life_collab/widgets/small-text-button.dart';

class OurLogin extends StatelessWidget {
  void forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    void navigateSignup() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OurSignUp()));
    }

    return Scaffold(
      body: Padding(
        padding: AppDimens.SCREEN_PADDING_SMALL,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    child: Text("Welcome Back",
                        style: AppStyles.TITLE_STYLE_BLACK),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: AppDimens.LARGE_SPACER),
                  OurLoginForm(),
                  SizedBox(height: AppDimens.SMALL_SPACER),
                  AlternativeLogin(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: AppStyles.SUBTITLE_STYLE),
                            SizedBox(width: AppDimens.SMALL_SPACER),
                            SmallTextButton(
                                click: navigateSignup,
                                text: "Create Account",
                                color: AppColors.PRIMARY_GREEN),
                          ],
                        ),
                        SmallTextButton(
                          click: forgotPassword,
                          text: "Forgot Password",
                          color: AppColors.SECONDARY_ORANGE,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
