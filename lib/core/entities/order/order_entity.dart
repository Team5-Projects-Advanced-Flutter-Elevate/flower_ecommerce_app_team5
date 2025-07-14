import '../order_item/order_item_entity.dart';

class OrderEntity {
  const OrderEntity({
    required this.id,
    required this.user,
    required this.orderItems,
    required this.totalPrice,
    required this.paymentType,
    required this.isPaid,
    required this.paidAt,
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
  final String? paidAt;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
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
        'paidAt: $paidAt, '
        'isDelivered: $isDelivered, '
        'state: $state, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'orderNumber: $orderNumber, '
        'v: $v'
        '}';
  }
}