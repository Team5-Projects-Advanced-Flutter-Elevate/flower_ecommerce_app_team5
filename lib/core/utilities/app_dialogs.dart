import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
abstract class AppDialogs {
  static void showMessage(
    context, {
    required String message,
    required bool isSuccess,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: isSuccess ? AppColors.green : AppColors.red,
          dismissDirection: DismissDirection.horizontal,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          margin: const EdgeInsets.all(8),
          behavior: SnackBarBehavior.floating,
        ),
      );

  static void showDialogWaiting(context) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );

  static void removeDialog(context) => Navigator.pop(context);
}
