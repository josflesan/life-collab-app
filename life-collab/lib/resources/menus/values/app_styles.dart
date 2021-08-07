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

  static const TextStyle ORANGE_UL_SUBTITLE_STYLE = TextStyle(
    fontSize: AppDimens.SUBTITLE_SIZE,
    fontFamily: 'Gilroy',
    color: AppColors.APP_BLACK,
    decorationColor: AppColors.SECONDARY_ORANGE,
    decoration: TextDecoration.underline,
  );

  static const TextStyle SMALL_HEADING_STYLE = TextStyle(
    fontSize: AppDimens.SMALL_HEADING_SIZE,
    fontFamily: 'Gilroy',
    color: AppColors.APP_DARK_GREY,
  );

  static const TextStyle ELEVATED_BUTTON_TEXT_STYLE = TextStyle(
    fontSize: AppDimens.BUTTON_TEXT,
    fontFamily: 'Gilroy',
    color: AppColors.APP_WHITE,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle LARGE_TEXT_BUTTON_STYLE = TextStyle(
    fontSize: AppDimens.BUTTON_TEXT,
    fontFamily: 'Gilroy',
    color: AppColors.APP_BLACK,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle SMALL_TEXT_BUTTON_STYLE = TextStyle(
    fontSize: 18.0,
    fontFamily: 'Gilroy',
    color: AppColors.APP_BLACK,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle FORM_LABEL_STYLE = TextStyle(
    fontSize: AppDimens.FORM_LABEL_TEXT_SIZE,
    fontFamily: 'Inter',
    color: AppColors.FADED_OUT_COLOUR,
  );

  static const TextStyle FORM_INPUT_STYLE = TextStyle(
    fontSize: AppDimens.FORM_INPUT_TEXT_SIZE,
    fontFamily: 'Inter',
    color: AppColors.APP_BLACK,
  );

  static const TextStyle PASSWORD_HIDDEN = TextStyle(
    fontSize: AppDimens.FORM_INPUT_TEXT_SIZE,
    fontFamily: 'Inter',
    color: AppColors.PRIMARY_GREEN,
  );

  // Button Styles

}
