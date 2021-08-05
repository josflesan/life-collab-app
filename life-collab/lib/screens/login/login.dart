import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/screens/login/localwidgets/login-form.dart';

class OurLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    padding: AppDimens.BUTTON_PADDING,
                    color: Colors.red,
                  ),
                  SizedBox(height: AppDimens.SMALL_SPACER),
                  Container(
                    width: double.infinity,
                    padding: AppDimens.BUTTON_PADDING,
                    color: Colors.red,
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
