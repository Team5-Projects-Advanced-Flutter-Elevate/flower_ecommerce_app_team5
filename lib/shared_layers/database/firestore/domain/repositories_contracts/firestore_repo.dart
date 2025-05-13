import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/entities/order/order_entity.dart';

abstract interface class FirestoreRepo {
  Stream<QuerySnapshot<OrderEntity>> getOrderSnapshot(String orderId);
}
