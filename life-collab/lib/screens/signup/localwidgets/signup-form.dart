import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/widgets/primary-button.dart';
import 'package:life_collab/widgets/text-form.dart';

class OurSignUpForm extends StatelessWidget {
  const OurSignUpForm({Key key}) : super(key: key);

  void validateUser() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppDimens.BUTTON_PADDING,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OurTextForm(
              labelText: "Name", hintText: "John Doe", icon: Icons.person),
          OurTextForm(
              labelText: "Email",
              hintText: "myemail@gmail.com",
              icon: Icons.mail_outline),
          SizedBox(height: AppDimens.SMALL_SPACER),
          OurTextForm(labelText: "Password", hintText: ""),
          SizedBox(height: AppDimens.SMALL_SPACER),
          OurPrimaryButton(
              click: validateUser,
              text: "Sign Up",
              color: AppColors.PRIMARY_GREEN),
        ],
      ),
    );
  }
}
