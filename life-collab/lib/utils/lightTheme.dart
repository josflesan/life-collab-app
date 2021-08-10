import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';

class LightTheme {
  ThemeData buildTheme(BuildContext context) {
    return ThemeData(
      canvasColor: AppColors.APP_WHITE,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.PRIMARY_GREEN)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
