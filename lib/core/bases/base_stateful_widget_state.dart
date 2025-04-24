import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/l10n_manager/localization_manager.dart';
import 'package:flutter/material.dart';

typedef VoidFunction = void Function()?;

abstract class BaseStatefulWidgetState<T extends StatefulWidget>
    extends State<T> {
  late ThemeData theme;
  late double screenWidth, screenHeight;
  late InheritedWidget easyLocalization;
  late LocalizationManager localizationManager;
  late ValidateFunctions validateFunctions;

  // This will always point to the correct context
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    easyLocalization = EasyLocalization.of(context)!;
    localizationManager = getIt.get<LocalizationManager>();
    localizationManager.changeLocaleOfEasyLocalization =
        setLocaleOfEasyLocalization;
    validateFunctions = ValidateFunctions.getInstance();
  }

  // Current fresh context with runtime check
  BuildContext get safeContext {
    try {
      // This will throw if context is inaccessible
      final ctx = context;
      // Verify we can use it
      if (ctx.mounted) { // Additional safety check
        return ctx;
      }
    } catch (_) {}

    // Fallback: Find the nearest context from the root
    return getIt.get<GlobalKey<NavigatorState>>().currentContext!;
  }


  Future<void> displayAlertDialog(
      {required Widget title,
      bool showOkButton = false,
      bool showConfirmButton = false,
      bool isDismissible = false,
      VoidFunction onOkButtonClick,
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
                      child: Text(LocaleKeys.confirm.tr(),
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: Colors.white)),
                    )),
              ),
          ],
        );
      },
    );
  }

  void hideAlertDialog() {
    Navigator.of(context).pop();
  }

  Future<void> setLocaleOfEasyLocalization(String newLocale) async {
    if (!safeContext.mounted) return Future.value();
    return safeContext.setLocale(Locale(newLocale));
  }
}
