import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/l10n_manager/localization_manager.dart';
import 'package:flutter/material.dart';

BuildContext? _context;

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  T _getInherited<T>(T Function(BuildContext) getter) {
    if (_context == null) {
      throw FlutterError('Cannot access inherited data before build');
    }
    return getter(_context!);
  }

  // Example getters
  ThemeData get theme => _getInherited((c) => Theme.of(c));
  InheritedWidget get easyLocalization =>
      _getInherited((c) => EasyLocalization.of(c)!);
  LocalizationManager get localizationManager =>
      getIt.get<LocalizationManager>();
  double get screenHeight => _getInherited(
        (c) => MediaQuery.of(c).size.height,
      );
  double get screenWidth => _getInherited(
        (c) => MediaQuery.of(c).size.width,
      );
  ValidateFunctions get validationFunction => ValidateFunctions.getInstance();

  @override
  Widget build(BuildContext context) {
    _context = context;
    localizationManager.changeLocaleOfEasyLocalization =
        setLocaleOfEasyLocalization;
    return customBuild(context);
  }

  Widget customBuild(BuildContext context);

  Future<void> setLocaleOfEasyLocalization(String newLocale) {
    return _context!.setLocale(Locale(newLocale));
  }
}
