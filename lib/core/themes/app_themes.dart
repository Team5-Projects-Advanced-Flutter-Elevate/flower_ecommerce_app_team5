import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColors.mainColor),
  );
}
