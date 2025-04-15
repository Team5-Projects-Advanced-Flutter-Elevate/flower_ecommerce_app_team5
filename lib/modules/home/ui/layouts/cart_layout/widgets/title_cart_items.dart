import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_item_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/utilities/app_dialogs.dart';
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
            child: BlocListener<CartCubit, CartState>(
              listenWhen: (previous, current) => current.deleteFromCartStatus !=previous.deleteFromCartStatus,
              listener: (context, state) {
                if (state.deleteFromCartStatus ==
                    DeleteFromCartStatus.success) {
                  AppDialogs.showMessage(
                    context,
                    message: 'Deleted Successfully',
                    isSuccess: false,
                  );
                }              },
              child: CartListView(
                cartItems: cartItems,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
