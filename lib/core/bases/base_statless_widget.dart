import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/l10n_manager/localization_manager.dart';
import 'package:flutter/material.dart';

BuildContext? _context;

// ignore: must_be_immutable
abstract class BaseStatelessWidget extends StatelessWidget {
  late ThemeData theme;
  late double screenWidth, screenHeight;
  late InheritedWidget easyLocalization;
  late LocalizationManager localizationManager;
  late ValidateFunctions validateFunctions;
  BaseStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    _context = context;
    theme = Theme.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    easyLocalization = EasyLocalization.of(context)!;
    localizationManager = getIt.get<LocalizationManager>();
    localizationManager.changeLocaleOfEasyLocalization =
        setLocaleOfEasyLocalization;
    validateFunctions = ValidateFunctions.getInstance();
    return customBuild(context);
  }

  Widget customBuild(BuildContext context);

  Future<void> setLocaleOfEasyLocalization(String newLocale) {
    return _context!.setLocale(Locale(newLocale));
  }
}
