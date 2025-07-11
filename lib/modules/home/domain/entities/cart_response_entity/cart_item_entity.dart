import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';

class CartItemEntity {
  final String? id;
  final ProductEntity? productEntity;
  final double? price;
  final num? quantity;

  CartItemEntity({
    this.id,
    this.productEntity,
    this.price,
    this.quantity,
  });
}
