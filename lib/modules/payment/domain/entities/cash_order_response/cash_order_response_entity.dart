import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';

class CashOrderResponseEntity extends Equatable {
  CashOrderResponseEntity({
    this.message,
    this.order,
  });

  String? message;
  OrderEntity? order;

  @override
  List<Object?> get props => [message, order];
}

class OrderEntity extends Equatable {
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
  @override
  List<Object?> get props => [
        user,
        orderItems,
        totalPrice,
        paymentType,
        isPaid,
        isDelivered,
        state,
        id,
        orderNumber,
        v
      ];
}

class OrderItemEntity extends Equatable {
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

  @override
  List<Object?> get props => [product, price, quantity, id];
}
