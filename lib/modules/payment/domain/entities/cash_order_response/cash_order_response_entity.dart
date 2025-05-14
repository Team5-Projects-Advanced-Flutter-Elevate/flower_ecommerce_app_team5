import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';

import '../../../../../core/entities/order/order_entity.dart';

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
