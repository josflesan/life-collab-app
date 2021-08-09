import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';

class ProfileDataPoint extends StatefulWidget {
  const ProfileDataPoint({Key key, this.title, this.data}) : super(key: key);

  final String title;
  final String data;

  @override
  _ProfileDataPointState createState() => _ProfileDataPointState();
}

class _ProfileDataPointState extends State<ProfileDataPoint> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.title,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Inter',
              color: AppColors.FADED_OUT_COLOUR,
              fontWeight: FontWeight.w500,
            )),
        SizedBox(height: AppDimens.SMALL_SPACER),
        Text(widget.data,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Inter',
              color: AppColors.APP_BLACK,
              fontWeight: FontWeight.w700,
            )),
      ],
    );
  }
}
