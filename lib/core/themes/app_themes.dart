import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      // Body Text Styles
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal, // Regular weight
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal, // Regular weight
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.normal, // Regular weight
        color: AppColors.black,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500, // Medium weight
        color: AppColors.gray,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500, // Medium weight
        color: AppColors.gray,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500, // Medium weight
        color: AppColors.gray,
      ),

      // Title Text Styles (Used for headings)
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600, // Semi-bold for emphasis
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600, // Semi-bold for emphasis
        color: AppColors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600, // Semi-bold for emphasis
        color: AppColors.black,
      ),

      // Label Text Styles (Used for form labels, buttons, etc.)

      // Headline Text Styles (Used for large headings)
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700, // Bold for emphasis
        color: AppColors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700, // Bold for emphasis
        color: AppColors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700, // Bold for emphasis
        color: AppColors.black,
      ),

      // Display Text Styles (Used for very large text, e.g., hero sections)
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800, // Extra-bold for emphasis
        color: AppColors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800, // Extra-bold for emphasis
        color: AppColors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800, // Extra-bold for emphasis
        color: AppColors.black,
      ),
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColors.mainColor),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      hintStyle: TextStyle(
        fontSize: 14, // Match your bodyMedium fontSize
        fontWeight: FontWeight.normal, // Match your bodyMedium fontWeight
        color: AppColors.gray, // Match your bodyMedium color
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return const TextStyle(color: Colors.red); // Red label in error state
        }
        return ThemeData.light().textTheme.titleSmall?.copyWith(
                  color:
                      AppColors.black.withOpacity(0.7), // Default label color
                ) ??
            const TextStyle();
      }),
      //suffixIcon: suffixIcon,
      fillColor: AppColors.white,
      filled: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.all(14),
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
