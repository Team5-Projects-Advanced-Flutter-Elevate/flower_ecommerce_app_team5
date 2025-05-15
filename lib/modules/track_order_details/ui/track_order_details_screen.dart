import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/extensions/int_extension/int_extension.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/database/firestore/ui/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderDetailsScreen extends StatefulWidget {
  final String orderId;

  const TrackOrderDetailsScreen({super.key, required this.orderId});

  @override
  State<TrackOrderDetailsScreen> createState() =>
      _TrackOrderDetailsScreenState();
}

class _TrackOrderDetailsScreenState extends State<TrackOrderDetailsScreen> {
  FirestoreViewModel firestoreViewModel = getIt.get<FirestoreViewModel>();

  @override
  void initState() {
    super.initState();
    debugPrint("=====> order Id from inside ${widget.orderId}");
    firestoreViewModel.listenToOrderUpdates(widget.orderId);
    //firestoreViewModel.getOrderSnapshot(widget.orderId);

    //firestoreViewModel.getAllDrivers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => firestoreViewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<FirestoreViewModel, FirestoreState>(
          builder: (context, state) {
            switch (state.orderStatus) {
              case Status.idle:
                return const SizedBox();
              case Status.loading:
                return const LoadingWidget();
              case Status.success:
                var orderEntity = state.orderEntity;
                var driverEntity = state.driverEntity;
                return orderEntity == null
                    ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Order Is Still Pending",
                            textAlign: TextAlign.center,
                          ),
                          Icon(Icons.pending_actions)
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Driver Info:"),
                              Text(driverEntity?.firstName ?? ""),
                              Text(driverEntity?.phone ?? ""),
                            ],
                          ),
                          if (orderEntity.receivedUserOrderAt != null)
                            Text(
                              "Received User Order At ${orderEntity.receivedUserOrderAt!.getDateFormat()}\n",
                              textAlign: TextAlign.center,
                            ),
                          if (orderEntity.preparedUserOrderAt != null)
                            Text(
                                "Prepared User Order At ${orderEntity.preparedUserOrderAt!.getDateFormat()}\n",
                                textAlign: TextAlign.center),
                          if (orderEntity.outForDeliveryAt != null)
                            Text(
                                "Out For Delivery At ${orderEntity.outForDeliveryAt!.getDateFormat()}\n",
                                textAlign: TextAlign.center),
                          if (orderEntity.deliveredAt != null)
                            Text(
                                "Delivered At ${orderEntity.deliveredAt!.getDateFormat()}\n",
                                textAlign: TextAlign.center),
                        ],
                      );
              case Status.error:
                return ErrorStateWidget(error: state.error!);
            }
          },
        ),
      ),
    );
  }
}
