import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_model_entity.dart';

class CartResponseEntity {
  final int? numOfCartItems;
  final CartModelEntity? cartModelEntity;
  final String? message;

  CartResponseEntity({
    this.numOfCartItems,
    this.cartModelEntity,
    this.message,
  });
}
