import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/screens/profile/localwidgets/profile_card.dart';
import 'package:life_collab/screens/root/root.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:life_collab/widgets/app-bar.dart';
import 'package:life_collab/widgets/large-text-button.dart';
import 'package:life_collab/widgets/primary-button.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key key}) : super(key: key);

  void exitGroup() {}

  @override
  Widget build(BuildContext context) {
    void logout() async {
      CurrentUser _currentUser =
          Provider.of<CurrentUser>(context, listen: false);
      String _returnString = await _currentUser.signOut();
      if (_returnString == "success") {
        pushNewScreen(
          context,
          screen: OurRoot(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      }
    }

    return Scaffold(
      appBar: OurAppBar(title: "Your Profile", icon: FontAwesomeIcons.user),
      body: Padding(
        padding: AppDimens.SCREEN_PADDING_SMALL,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimens.SMALL_SPACER),
                  ProfileCard(),
                  SizedBox(height: AppDimens.LARGE_SPACER),
                  OurPrimaryButton(
                      click: exitGroup,
                      text: "Exit Household",
                      color: AppColors.DANGER_RED),
                  LargeTextButton(
                    click: logout,
                    text: "Log Out",
                    color: AppColors.APP_BLACK,
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
