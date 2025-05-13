import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity.dart';
import 'package:flower_ecommerce_app_team5/core/models/driver/driver_dto.dart';
import 'package:flower_ecommerce_app_team5/core/models/order/order_dto.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/database/firestore/constants/firestore_constants.dart';
import 'package:injectable/injectable.dart';
import '../data_sources_abstracts/order_collection.dart';

@Injectable(as: OrderCollection)
class OrderCollectionImp implements OrderCollection {
  @override
  Stream<QuerySnapshot<OrderEntity>> getOrderSnapshot(String orderId) async* {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    yield* firestore
        .collectionGroup(FirestoreConstants.ordersCollection)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return OrderDto.fromJson(snapshot.data()).convertIntoEntity();
          },
          toFirestore: (orderEntity, options) {
            return OrderDto.convertIntoDto(orderEntity).toJson();
          },
        )
        .where(FieldPath.documentId, isEqualTo: orderId)
        .snapshots();
  }
}
