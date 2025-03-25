import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColors.mainColor),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.white,
      iconTheme: WidgetStateProperty.resolveWith(
        (states) {
          Color color;
          if (states.contains(WidgetState.selected)) {
            color = AppColors.mainColor;
          } else {
            color = AppColors.white[80]!;
          }
          return IconThemeData(
            color: color,
          );
        },
      ),
      indicatorColor: Colors.transparent,
      indicatorShape: const RoundedRectangleBorder(),
      labelTextStyle: WidgetStatePropertyAll(GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          )),
    ),
  );
}
