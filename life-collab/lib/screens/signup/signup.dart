import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/screens/login/login.dart';
import 'package:life_collab/widgets/small-text-button.dart';

import 'localwidgets/alternative-signup.dart';
import 'localwidgets/signup-form.dart';

class OurSignUp extends StatelessWidget {
  const OurSignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateSignup() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OurLogin()));
    }

    void forgotPassword() {}

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
                    child: Text("A Fresh Start",
                        style: AppStyles.TITLE_STYLE_BLACK),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: AppDimens.LARGE_SPACER),
                  OurSignUpForm(),
                  SizedBox(height: AppDimens.SMALL_SPACER),
                  AlternativeSignup(),
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
                            Text("Already have an account?",
                                style: AppStyles.SUBTITLE_STYLE),
                            SizedBox(width: AppDimens.SMALL_SPACER),
                            SmallTextButton(
                                click: navigateSignup,
                                text: "Login",
                                color: AppColors.PRIMARY_GREEN),
                          ],
                        ),
                        SizedBox(height: AppDimens.LARGE_SPACER),
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
