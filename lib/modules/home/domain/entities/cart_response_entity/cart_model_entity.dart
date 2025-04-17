import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_item_entity.dart';

class CartModelEntity {
  final String? id;
  final String? user;
  final List<CartItemEntity>? cartItems;
  final double? discount;
  final double? totalPrice;
  final double? totalPriceAfterDiscount;

  CartModelEntity({
    this.id,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
  });

}