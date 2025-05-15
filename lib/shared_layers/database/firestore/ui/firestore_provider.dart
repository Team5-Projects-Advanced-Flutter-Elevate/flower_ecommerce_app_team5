import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/core/entities/driver/driver_entity.dart';
import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity_firestore.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/database/firestore/domain/repositories_contracts/firestore_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/models/driver/driver_dto.dart';

@injectable
class FirestoreViewModel extends Cubit<FirestoreState> {
  final FirestoreRepo _firestoreRepo;
  FirestoreViewModel(this._firestoreRepo) : super(const FirestoreState());

  void listenToOrderUpdates(String orderId) {
    // Query to find the order by its ID in all Orders collections
    _firestoreRepo.getOrderSnapshot(orderId).listen((ordersSnapshot) async {
      if (ordersSnapshot.docs.isNotEmpty) {
        emit(const FirestoreState(orderStatus: Status.loading));
        var orderDoc = ordersSnapshot.docs.first;
        var orderData = orderDoc.data();
        var driverDocRef = orderDoc.reference.parent.parent?.withConverter(
          fromFirestore: (snapshot, options) {
            if (snapshot.data() == null) return null;
            return DriverDto.fromJson(snapshot.data());
          },
          toFirestore: (driverDto, options) {
            if(driverDto == null) return {};
            return driverDto.toJson();
          },
        );
        var driverDoc = await driverDocRef?.get();
        var driverData = driverDoc?.data();

        print('Order Data: $orderData');
        print('Driver Data: $driverData');
        emit(FirestoreState(
            orderStatus: Status.success,
            orderEntity: orderData,
            driverEntity: driverData?.convertIntoEntity()));
      } else {
        print('Order not found');
      }
    }, onError: (error) {});
  }
}

enum Status { idle, loading, success, error }

class FirestoreState extends Equatable {
  final Status orderStatus;
  final OrderEntityFirestore? orderEntity;
  final DriverEntity? driverEntity;
  final Object? error;

  const FirestoreState(
      {this.orderStatus = Status.idle,
      this.orderEntity,
      this.driverEntity,
      this.error});
  @override
  List<Object?> get props => [orderStatus, orderEntity, driverEntity, error];
}
