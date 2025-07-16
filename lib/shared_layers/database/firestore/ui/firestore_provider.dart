import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/core/entities/driver/driver_entity.dart';
import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity_firestore.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/database/firestore/domain/repositories_contracts/firestore_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/models/driver/driver_dto.dart';
import '../constants/firestore_constants.dart';

@injectable
class FirestoreViewModel extends Cubit<FirestoreState> {
  final FirestoreRepo _firestoreRepo;

  FirestoreViewModel(this._firestoreRepo) : super(const FirestoreState());

  void listenToOrderUpdates(String orderId) {
    DriverEntity? driverData;
    OrderEntityFirestore? orderData;
    // Query to find the order by its ID in all Orders collections
    _firestoreRepo.getOrderSnapshot(orderId).listen((ordersSnapshot) async {
      if (ordersSnapshot.docs.isNotEmpty) {
        emit(const FirestoreState(orderStatus: Status.loading));
        var orderDoc = ordersSnapshot.docs.first;
        orderData = orderDoc.data();
        var driverDocRef = orderDoc.reference.parent.parent?.withConverter(
          fromFirestore: (snapshot, options) {
            if (snapshot.data() == null) return null;
            return DriverDto.fromJson(snapshot.data()).convertIntoEntity();
          },
          toFirestore: (driverEntity, options) {
            if (driverEntity == null) return {};
            return DriverDto.convertIntoDto(driverEntity).toJson();
          },
        );
        var driverDoc = await driverDocRef?.get();
        driverData = driverDoc?.data();

        debugPrint('Order Data: $orderData');
        debugPrint('Driver Data: $driverData');
      } else {
        debugPrint('Order not found');
      }
      emit(FirestoreState(
          orderStatus: Status.success,
          orderEntity: orderData,
          driverEntity: driverData));
    }, onError: (error) {
      emit(FirestoreState(orderStatus: Status.error, error: error));
    });
  }

  void getOrderSnapshot(String orderId) async {
    debugPrint("====> order Id inside getOrderSnapshot $orderId}");
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var result = await firestore
        .collectionGroup(FirestoreConstants.ordersCollection)
        .where('_id', isEqualTo: orderId)
        .get();

    var driverDocRef = result.docs.first.reference.parent.parent;
    debugPrint("++++++ driverId: ${driverDocRef?.id}");
    var resultList = result.docs;
    for (int i = 0; i < resultList.length; i++) {
      debugPrint("+++++++++++ ${resultList[i].id}");
    }
  }

  void getAllDrivers() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var result =
        await firestore.collection(FirestoreConstants.driversCollection).get();
    var listResult = result.docs;
    for (int i = 0; i < listResult.length; i++) {
      debugPrint("++++++++++++ ${listResult[i].id}");
    }
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
