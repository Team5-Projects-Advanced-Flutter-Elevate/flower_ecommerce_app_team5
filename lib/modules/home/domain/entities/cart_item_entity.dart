import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';

class CartItemEntity {
  final String? id;
  final ProductEntity? productEntity;
  final double? price;
  final int? quantity;

  CartItemEntity({this.id, this.productEntity, this.price, this.quantity});
}