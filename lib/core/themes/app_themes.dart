import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    dialogBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      labelMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.mainColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.white[70],
        ),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.white[90],
        ),
        errorMaxLines: 4,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
        errorStyle: TextStyle(
          color: AppColors.red,
          fontSize: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        )),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColors.mainColor,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColors.white,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStatePropertyAll(
        AppColors.mainColor,
      ),
    ),
  );
}
