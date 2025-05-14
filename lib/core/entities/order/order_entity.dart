import 'package:flower_ecommerce_app_team5/modules/order_page/domain/entity/order_page_entity.dart';

class OrderEntity {
  const OrderEntity({
    required this.id,
    required this.user,
    required this.orderItems,
    required this.totalPrice,
    required this.paymentType,
    required this.isPaid,
    required this.isDelivered,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.orderNumber,
    required this.v,
  });

  final String? id;
  final String? user;
  final List<OrderItemEntity>? orderItems;
  final num? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? orderNumber;
  final num? v;

  @override
  String toString() {
    return 'Order{'
        'id: $id, '
        'user: $user, '
        'orderItems: $orderItems, '
        'totalPrice: $totalPrice, '
        'paymentType: $paymentType, '
        'isPaid: $isPaid, '
        'isDelivered: $isDelivered, '
        'state: $state, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'orderNumber: $orderNumber, '
        'v: $v'
        '}';
  }
}