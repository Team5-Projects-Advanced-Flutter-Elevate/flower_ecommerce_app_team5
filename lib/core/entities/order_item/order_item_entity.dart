import '../product/product_entity.dart';

class OrderItemEntity {
  OrderItemEntity({this.product, this.price, this.quantity, this.id});

  ProductEntity? product;
  num? price;
  num? quantity;
  String? id;
}