import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static final TextTheme _textTheme = TextTheme(
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.gray,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.white,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        padding: EdgeInsets.all(14),
        backgroundColor: AppColors.mainColor,
        //disabledBackgroundColor: AppColors.mainColor.shade100,
        // disabledForegroundColor: AppColors.gray,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color: AppColors.gray,
            )),
        textStyle: _textTheme.headlineMedium!.copyWith(
          fontSize: 16,
          color: AppColors.gray,
        ),
      ),
    ),
  );
}
