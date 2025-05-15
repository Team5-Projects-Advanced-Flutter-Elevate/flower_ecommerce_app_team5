import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/entities/order/order_entity_firestore.dart';

abstract interface class FirestoreRepo {
  Stream<QuerySnapshot<OrderEntityFirestore?>> getOrderSnapshot(String orderId);
}
