import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity_firestore.dart';
import 'package:flower_ecommerce_app_team5/core/models/order/order_dto_firestore.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/database/firestore/constants/firestore_constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../data_sources_abstracts/order_collection.dart';

@Injectable(as: OrderCollection)
class OrderCollectionImp implements OrderCollection {
  @override
  Stream<QuerySnapshot<OrderEntityFirestore?>> getOrderSnapshot(
      String orderId) async* {
    debugPrint("====> order Id inside getOrderSnapshot $orderId}");
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    yield* firestore
        .collectionGroup(FirestoreConstants.ordersCollection)
        .withConverter(
          fromFirestore: (snapshot, options) {
            if (snapshot.data() == null) return null;
            return OrderDtoFirestore.fromJson(snapshot.data())
                .convertIntoEntity();
          },
          toFirestore: (orderEntity, options) {
            if (orderEntity == null) return {};
            return OrderDtoFirestore.convertIntoDto(orderEntity).toJson();
          },
        )
        .where(FirestoreConstants.orderIdKey, isEqualTo: orderId)
        .snapshots();
  }
}
