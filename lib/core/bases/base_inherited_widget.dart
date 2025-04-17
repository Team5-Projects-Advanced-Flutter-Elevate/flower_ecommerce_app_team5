import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/l10n_manager/localization_manager.dart';
import 'package:flutter/material.dart';

class BaseInheritedWidget extends InheritedWidget {
  final ThemeData theme;
  final double screenWidth, screenHeight;
  final InheritedWidget easyLocalization;
  final LocalizationManager localizationManager;
  final ValidateFunctions validateFunctions;

  const BaseInheritedWidget({
    super.key,
    required this.theme,
    required this.screenWidth,
    required this.screenHeight,
    required this.easyLocalization,
    required this.localizationManager,
    required this.validateFunctions,
    required super.child,
  });

  static BaseInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BaseInheritedWidget>()
        as BaseInheritedWidget;
  }

  @override
  bool updateShouldNotify(BaseInheritedWidget oldWidget) {
    return oldWidget.theme != theme ||
        oldWidget.screenWidth != screenWidth ||
        oldWidget.screenHeight != screenHeight ||
        oldWidget.easyLocalization != easyLocalization ||
        oldWidget.localizationManager != localizationManager ||
        oldWidget.validateFunctions != validateFunctions;
  }
}
