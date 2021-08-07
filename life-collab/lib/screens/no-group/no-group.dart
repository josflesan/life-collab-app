import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/widgets/large-text-button.dart';
import 'package:life_collab/widgets/primary-button.dart';

class NoGroupScreen extends StatelessWidget {
  const NoGroupScreen({Key key}) : super(key: key);

  void navigateJoinGroup() {}

  void navigateCreateGroup() {}

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Oops!", style: AppStyles.TITLE_STYLE_BLACK),
                        SizedBox(height: AppDimens.SMALL_SPACER),
                        Text("Looks like you're not part of a household yet...",
                            style: AppStyles.SUBTITLE_STYLE),
                        SizedBox(height: AppDimens.LARGE_SPACER),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Create",
                                style: AppStyles.ORANGE_UL_SUBTITLE_STYLE),
                            Text(" or ", style: AppStyles.SUBTITLE_STYLE),
                            Text("Join",
                                style: AppStyles.ORANGE_UL_SUBTITLE_STYLE),
                            Text(" one now to begin",
                                style: AppStyles.SUBTITLE_STYLE),
                          ],
                        ),
                        SizedBox(height: AppDimens.XLARGE_SPACER),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/no-group-graphic.png'),
                  SizedBox(height: AppDimens.XXLARGE_SPACER),
                  Container(
                    child: Column(
                      children: [
                        OurPrimaryButton(
                            click: navigateJoinGroup,
                            text: "Join Group",
                            color: AppColors.SECONDARY_ORANGE),
                        SizedBox(height: AppDimens.SMALL_SPACER),
                        LargeTextButton(
                          click: navigateCreateGroup,
                          text: "Create Group",
                          color: AppColors.APP_BLACK,
                        ),
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
