import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import '../../../../core/bases/base_inherited_widget.dart';
import '../../../../core/bases/base_statless_widget.dart';
import '../../../../core/routing/defined_routes.dart';
import '../../../../shared_layers/localization/generated/locale_keys.g.dart';

class OrderPlacedSuccessfullyScreen extends BaseStatelessWidget {
  const OrderPlacedSuccessfullyScreen({super.key});

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.trackOrder.tr(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AssetsPaths.successIcon,
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: inherit.screenHeight * 0.06,
            ),
            Text(
              LocaleKeys.orderPlacedSuccess.tr(),
              textAlign: TextAlign.center,
              style: inherit.theme.textTheme.bodyMedium?.copyWith(
                fontSize: 24 * (inherit.screenWidth / 375),
              ),
            ),
            SizedBox(
              height: inherit.screenHeight * 0.03,
            ),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, DefinedRoutes.trackOrder);
              },
              child: Text(
                LocaleKeys.trackOrder.tr(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
