import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/database/firestore/domain/repositories_contracts/firestore_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/entities/order/order_entity.dart';
import '../data_sources_abstracts/order_collection.dart';

@Injectable(as: FirestoreRepo)
class FirestoreRepoImp implements FirestoreRepo {
  final OrderCollection _orderCollection;
  FirestoreRepoImp(this._orderCollection);
  @override
  Stream<QuerySnapshot<OrderEntity>> getOrderSnapshot(String orderId) async* {
    yield* _orderCollection.getOrderSnapshot(orderId);
  }
}
