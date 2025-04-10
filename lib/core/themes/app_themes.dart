import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static final TextTheme _textTheme = TextTheme(
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.gray,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      // Body Text Styles
      labelMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
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
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.mainColor,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.white,
    ),
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
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.mainColor,
          );
        } else {
          return GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.white[80],
          );
        }
      }),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.pink,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.pink,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    ),


    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 4,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(4),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.red,
        ),
      ),
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
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
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
