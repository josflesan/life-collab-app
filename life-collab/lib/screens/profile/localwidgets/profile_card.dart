import 'package:flutter/material.dart';
import 'package:life_collab/models/user.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
import 'package:life_collab/screens/profile/localwidgets/data_point.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    OurUser _userData = _currentUser.getCurrentUser;

    String _firstName = _userData.fullName.split(" ")[0];
    String _secondName = _userData.fullName.split(" ")[1];

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: AppDimens.BUTTON_PADDING,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
        color: AppColors.APP_WHITE,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(children: [
        CircleAvatar(
          radius: 75,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(_userData.profilePic.toString()),
        ),
        SizedBox(height: AppDimens.LARGE_SPACER),
        Text("${_firstName} ${_secondName}",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Inter',
              color: AppColors.APP_BLACK,
              fontWeight: FontWeight.w700,
            )),
        SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileDataPoint(title: "To-Do", data: "3"),
            ProfileDataPoint(title: "Money Spent", data: "£70"),
            ProfileDataPoint(title: "Flatmates", data: "5"),
          ],
        ),
      ]),
    );
  }
}
