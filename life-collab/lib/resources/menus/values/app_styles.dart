import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';

class AppStyles {
  // Text Styles
  static const TextStyle TITLE_STYLE_BLACK = TextStyle(
    fontSize: AppDimens.TITLE_SIZE,
    fontFamily: 'Gilroy',
    color: AppColors.APP_BLACK,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle TITLE_STYLE_GREEN = TextStyle(
    fontSize: AppDimens.TITLE_SIZE,
    fontFamily: 'Gilroy',
    color: AppColors.PRIMARY_GREEN,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle SUBTITLE_STYLE = TextStyle(
    fontSize: AppDimens.SUBTITLE_SIZE,
    fontFamily: 'Gilroy',
    color: AppColors.APP_BLACK,
  );

  static const TextStyle ELEVATED_BUTTON_TEXT_STYLE = TextStyle(
    fontSize: AppDimens.BUTTON_TEXT,
    fontFamily: 'Gilroy',
    color: AppColors.APP_WHITE,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle TEXT_BUTTON_STYLE = TextStyle(
    fontSize: AppDimens.BUTTON_TEXT,
    fontFamily: 'Gilroy',
    color: AppColors.APP_BLACK,
    fontWeight: FontWeight.w700,
  );

  // Button Styles

}
