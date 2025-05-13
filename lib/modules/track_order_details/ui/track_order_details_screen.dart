import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/extensions/int_extension/int_extension.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/database/firestore/ui/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderDetailsScreen extends StatefulWidget {
  const TrackOrderDetailsScreen({super.key});

  @override
  State<TrackOrderDetailsScreen> createState() => _TrackOrderDetailsScreenState();
}

class _TrackOrderDetailsScreenState extends State<TrackOrderDetailsScreen> {
  FirestoreViewModel firestoreViewModel = getIt.get<FirestoreViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => firestoreViewModel,
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<FirestoreViewModel, FirestoreState>(
              builder: (context, state) {
                switch (state.orderStatus) {
                  case Status.idle:
                    return const SizedBox();
                  case Status.loading:
                    return const LoadingWidget();
                  case Status.success:
                    var orderEntity = state.orderEntity;
                    var driverEntity = state.driverEntity;
                    return Column(
                      children: [
                        Column(
                          children: [
                            Text(driverEntity?.firstName ?? ""),
                            Text(driverEntity?.phone ?? ""),
                          ],
                        ),
                        if (orderEntity?.receivedUserOrderAt != null)
                          Text(
                              "Received User Order At ${orderEntity!.receivedUserOrderAt!.getDateFormat()}\n"),
                        if (orderEntity?.preparedUserOrderAt != null)
                          Text(
                              "Prepared User Order At ${orderEntity!.preparedUserOrderAt!.getDateFormat()}"),
                        if (orderEntity?.outForDeliveryAt != null)
                          Text(
                              "Out Fore Delivery At ${orderEntity!.outForDeliveryAt!.getDateFormat()}"),
                        if (orderEntity?.deliveredAt != null)
                          Text(
                              "Delivered At ${orderEntity!.deliveredAt!.getDateFormat()}"),
                      ],
                    );
                  case Status.error:
                    return ErrorStateWidget(error: state.error!);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
