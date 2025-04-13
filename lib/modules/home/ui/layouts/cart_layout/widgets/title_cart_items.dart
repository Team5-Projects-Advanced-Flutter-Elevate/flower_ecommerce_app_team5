import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_item_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import 'cart_list_view.dart';

class TitleAndCartItems extends BaseStatelessWidget {
  TitleAndCartItems({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget customBuild(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Cart ',
                style: theme.textTheme.labelMedium,
              ),
              Text(
                '(3 items)',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.gray,
                ),
              )
            ],
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Expanded(
            child: CartListView(
              cartItems: cartItems,
            ),
          ),
        ],
      ),
    );
  }
}
