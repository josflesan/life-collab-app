import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/widgets/primary-button.dart';
import 'package:life_collab/widgets/text-form.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({Key key}) : super(key: key);

  void navigateHome() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppDimens.SCREEN_PADDING_LARGE,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Introductions",
                                  style: AppStyles.TITLE_STYLE_BLACK),
                              SizedBox(height: AppDimens.SMALL_SPACER),
                              Text(
                                "Every household has an identity.",
                                style: AppStyles.SUBTITLE_STYLE,
                              ),
                              SizedBox(height: AppDimens.SMALL_SPACER),
                              Text("What's yours?",
                                  style: AppStyles.SUBTITLE_STYLE),
                              SizedBox(height: AppDimens.XXLARGE_SPACER),
                              OurTextForm(
                                  labelText: "Household Name", hintText: ""),
                            ],
                          ),
                        ),
                        OurPrimaryButton(
                            click: navigateHome,
                            text: "Begin",
                            color: AppColors.SECONDARY_ORANGE),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
