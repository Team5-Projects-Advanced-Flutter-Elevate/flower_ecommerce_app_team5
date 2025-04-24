import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';

class CashOrderResponseEntity extends Equatable {
  const CashOrderResponseEntity({
    this.message,
    this.order,
  });

  final String? message;
  final OrderEntity? order;

  @override
  List<Object?> get props => [message, order];
}

class OrderEntity extends Equatable {
  const OrderEntity({
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

  final String? user;
  final List<OrderItemEntity>? orderItems;
  final num? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? id;
  final String? orderNumber;
  final num? v;
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
  const OrderItemEntity({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  final ProductEntity? product;
  final num? price;
  final num? quantity;
  final String? id;

  @override
  List<Object?> get props => [product, price, quantity, id];
}
