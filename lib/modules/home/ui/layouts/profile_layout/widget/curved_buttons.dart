import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CurvedButton extends StatelessWidget {
  const CurvedButton({
    super.key,
    this.color,
    required this.title,
    required this.onTap,
    this.height,
    this.width,
    this.colorBorderSide,
    this.textColor,
    this.style,
  });

  final Color? color;
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? colorBorderSide;
  final Color? textColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          //padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 24),
          backgroundColor: color ?? AppColors.mainColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: colorBorderSide ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          title,
          style: style ??
              TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).textScaler.scale(16),
                color: textColor ?? AppColors.white,
              ),
        ),
      ),
    );
  }
}
