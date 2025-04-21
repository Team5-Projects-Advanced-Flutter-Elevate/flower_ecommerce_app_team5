import 'package:flutter/material.dart';

import '../../../../core/bases/base_inherited_widget.dart';
import '../../../../core/bases/base_statless_widget.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/routing/defined_routes.dart';
import '../../../home/domain/entities/cart_response_entity/cart_response_entity.dart';
import '../../../home/ui/layouts/cart_layout/widgets/invoice_section.dart';

class PlaceOrderSection extends BaseStatelessWidget {
  const PlaceOrderSection({super.key, required this.cartResponseEntity});

  final CartResponseEntity cartResponseEntity;

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              InvoiceSection(
                cartResponseEntity: cartResponseEntity,
              ),
              SizedBox(
                height: inherit.screenHeight * 0.03,
              ),
            ],
          ),
          FilledButton(
            onPressed: () {},
            child: Text(
              'Place order',
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
