import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity_firestore.dart';

abstract interface class OrderCollection {
  Stream<QuerySnapshot<OrderEntityFirestore>> getOrderSnapshot(String orderId);
}
