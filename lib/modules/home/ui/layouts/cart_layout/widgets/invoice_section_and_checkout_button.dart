import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import 'invoice_section.dart';

class InvoiceSectionAndCheckoutButton extends BaseStatelessWidget {
  const InvoiceSectionAndCheckoutButton(
      {super.key, required this.cartResponseEntity});

  final CartResponseEntity cartResponseEntity;

  @override
  Widget customBuild(BuildContext context, inherit) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                InvoiceSection(
                  cartResponseEntity: cartResponseEntity,
                ),
                SizedBox(
                  height: inherit.screenHeight * 0.03,
                ),
              ],
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                DefinedRoutes.checkOut,
                arguments: cartResponseEntity,
              );
            },
            child: Text(
              LocaleKeys.checkout.tr(),
              style: inherit.theme.textTheme.labelMedium?.copyWith(
                fontSize: 16 * (inherit.screenWidth / 375),
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
