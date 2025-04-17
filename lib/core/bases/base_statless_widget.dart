import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/l10n_manager/localization_manager.dart';
import 'package:flutter/material.dart';

import '../../shared_layers/localization/generated/locale_keys.g.dart';
import 'base_stateful_widget_state.dart';

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

  Future<void> displayAlertDialog(
      {required Widget title,
      bool showOkButton = false,
      bool showConfirmButton = false,
      bool isDismissible = false,
      VoidFunction onOkButtonClick,
      required BuildContext context,
      VoidFunction onConfirmButtonClick}) {
    return showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        return AlertDialog(
          title: title,
          actions: [
            if (showOkButton)
              FilledButton(
                  onPressed: () => onOkButtonClick == null
                      ? Navigator.pop(context)
                      : onOkButtonClick(),
                  child: Text(
                    LocaleKeys.ok.tr(),
                    style: theme.textTheme.labelMedium!
                        .copyWith(color: Colors.white),
                  )),
            if (showConfirmButton)
              Center(
                child: ElevatedButton(
                    onPressed: onConfirmButtonClick,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16),
                      child: Text(
                        LocaleKeys.confirm.tr(),
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
          ],
        );
      },
    );
  }

  void hideAlertDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
