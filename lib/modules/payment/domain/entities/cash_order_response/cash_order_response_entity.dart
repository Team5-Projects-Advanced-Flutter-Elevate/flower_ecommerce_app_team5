import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';

class CashOrderResponseEntity {
  CashOrderResponseEntity({
    this.message,
    this.order,
  });

  String? message;
  OrderEntity? order;
}

class OrderEntity {
  OrderEntity({
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.id,
    this.orderNumber,
    this.v,
  });

  String? user;
  List<OrderItemEntity>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? id;
  String? orderNumber;
  num? v;
}

class OrderItemEntity {
  OrderItemEntity({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  ProductEntity? product;
  num? price;
  num? quantity;
  String? id;
}
