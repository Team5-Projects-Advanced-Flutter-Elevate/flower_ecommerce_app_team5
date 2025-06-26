import 'package:equatable/equatable.dart';
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
