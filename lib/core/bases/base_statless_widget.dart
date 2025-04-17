import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_inherited_widget.dart';
import 'package:flutter/material.dart';

import '../../shared_layers/localization/generated/locale_keys.g.dart';
import 'base_stateful_widget_state.dart';

BuildContext? _context;
late ThemeData _theme;

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    _context = context;
    BaseInheritedWidget inherit = BaseInheritedWidget.of(context);
    _theme = inherit.theme;
    inherit.localizationManager.changeLocaleOfEasyLocalization =
        setLocaleOfEasyLocalization;

    return customBuild(context, inherit);
  }

  Widget customBuild(BuildContext context, BaseInheritedWidget inherit);

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
                    style: _theme.textTheme.labelMedium!
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
                        style: _theme.textTheme.labelMedium!.copyWith(
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
