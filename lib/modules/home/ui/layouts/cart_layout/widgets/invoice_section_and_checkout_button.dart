import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import 'invoice_section.dart';

class InvoiceSectionAndCheckoutButton extends BaseStatelessWidget {
  InvoiceSectionAndCheckoutButton({
    super.key,
    required this.cartResponseEntity
  });
final CartResponseEntity cartResponseEntity;
  @override
  Widget customBuild(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                InvoiceSection(cartResponseEntity: cartResponseEntity,),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: FilledButton(
              onPressed: () {},
              child: Text(
                'Checkout',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 16 * (screenWidth / 375),
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
