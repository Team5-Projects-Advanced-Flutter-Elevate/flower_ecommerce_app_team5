import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_item_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/widgets/cart_item.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../core/bases/base_statless_widget.dart';

class CartListView extends BaseStatelessWidget {
  const CartListView({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget customBuild(BuildContext context, inherit) {
    return ListView.separated(
      itemBuilder: (context, index) => CartItem(
        cartItemEntity: cartItems[index],
      ),
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => SizedBox(
        height: inherit.screenHeight * 0.025,
      ),
    );
  }
}
