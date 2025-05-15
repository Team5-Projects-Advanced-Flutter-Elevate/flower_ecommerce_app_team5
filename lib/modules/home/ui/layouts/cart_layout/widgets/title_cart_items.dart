import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_item_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import 'cart_list_view.dart';

class TitleAndCartItems extends BaseStatelessWidget {
  const TitleAndCartItems({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget customBuild(BuildContext context, inherit) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                LocaleKeys.cart.tr(),
                style: inherit.theme.textTheme.labelMedium,
              ),
              Text(
                '(${cartItems.length} ${LocaleKeys.items.tr()})',
                style: inherit.theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.gray,
                ),
              )
            ],
          ),
          SizedBox(
            height: inherit.screenHeight * 0.02,
          ),
          Expanded(
            child: BlocListener<CartCubit, CartState>(
              listenWhen: (previous, current) =>
                  current.deleteFromCartStatus != previous.deleteFromCartStatus,
              listener: (context, state) {
                if (state.deleteFromCartStatus ==
                    DeleteFromCartStatus.success) {
                  displayAlertDialog(
                    title: Text(
                      LocaleKeys.deletedSuccessfully.tr(),
                      textAlign: TextAlign.center,
                    ),
                    isDismissible: true,
                    autoDismissible: true,
                  );
                  // AppDialogs.showMessage(
                  //   context,
                  //   message: LocaleKeys.deletedSuccessfully.tr(),
                  //   isSuccess: false,
                  // );
                }
              },
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
