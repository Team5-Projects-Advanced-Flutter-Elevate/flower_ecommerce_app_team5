import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity_firestore.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/extensions/int_extension/int_extension.dart';
import 'package:flower_ecommerce_app_team5/modules/track_order/ui/widgets/car_image.dart';
import 'package:flower_ecommerce_app_team5/modules/track_order/ui/widgets/driver_information.dart';
import 'package:flower_ecommerce_app_team5/modules/track_order/ui/widgets/estimated_arrival.dart';
import 'package:flower_ecommerce_app_team5/modules/track_order/ui/widgets/order_time_line.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bases/base_stateful_widget_state.dart';
import '../../../core/widgets/error_state_widget.dart';
import '../../../core/widgets/loading_state_widget.dart';
import '../../../shared_layers/database/firestore/ui/firestore_provider.dart';

class TrackOrderView extends StatefulWidget {
  final String orderId;
  const TrackOrderView({super.key, required this.orderId});

  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends BaseStatefulWidgetState<TrackOrderView> {
  FirestoreViewModel firestoreViewModel = getIt.get<FirestoreViewModel>();

  @override
  void initState() {
    super.initState();
    debugPrint("=====> order Id from inside ${widget.orderId}");
    firestoreViewModel.listenToOrderUpdates(widget.orderId);
  }

  late OrderEntityFirestore? orderEntity;
  List<String> timestamps = [
    LocaleKeys.pending.tr(),
    LocaleKeys.pending.tr(),
    LocaleKeys.pending.tr(),
    LocaleKeys.pending.tr(),
  ];
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => firestoreViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.trackOrder.tr(),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: BlocBuilder<FirestoreViewModel, FirestoreState>(
            builder: (context, state) {
              switch (state.orderStatus) {
                case Status.idle:
                  return const SizedBox();
                case Status.loading:
                  return const LoadingWidget();
                case Status.success:
                  orderEntity = state.orderEntity;
                  if (orderEntity != null) {
                    updateTimestampsList();
                  }
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
                          children: [
                            Expanded(
                              flex: 3,
                              child: EstimatedArrival(
                                estimatedArrival: orderEntity
                                    ?.receivedUserOrderAt
                                    ?.getDataFormatAfterAdding(
                                        const Duration(hours: 2)),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DriverInformation(
                                driverEntity: driverEntity,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.03,
                            ),
                            const Expanded(
                              flex: 3,
                              child: CarImage(),
                            ),
                            Expanded(
                              flex: 12,
                              child: OrderTimeLine(
                                timestamps: timestamps,
                                activeStep: activeStep,
                              ),
                            ),
                            FilledButton(
                              onPressed: () {},
                              child: Text(
                                LocaleKeys.showMap.tr(),
                              ),
                            ),
                          ],
                        );
                case Status.error:
                  return ErrorStateWidget(error: state.error!);
              }
            },
          ),
        ),
      ),
    );
  }

  void updateTimestampsList() {
    if (orderEntity!.receivedUserOrderAt != null) {
      timestamps[0] = orderEntity!.receivedUserOrderAt!.getDateFormat();
    }
    if (orderEntity!.preparedUserOrderAt != null) {
      timestamps[1] = orderEntity!.preparedUserOrderAt!.getDateFormat();
    }
    if (orderEntity!.outForDeliveryAt != null) {
      timestamps[2] = orderEntity!.outForDeliveryAt!.getDateFormat();
    }
    if (orderEntity!.deliveredAt != null) {
      timestamps[3] = orderEntity!.deliveredAt!.getDateFormat();
    }
    calculateActiveStep();
  }

  void calculateActiveStep() {
    debugPrint("timestamps list: $timestamps");
    var result = timestamps.where(
      (element) {
        return element != 'Pending...';
      },
    ).toList();
    debugPrint("resulted list: $result");
    debugPrint("resulted list last elem: $result");
    if (result.isEmpty) {
      activeStep = 0;
      return;
    }
    activeStep = result.length - 1;
    debugPrint("active step: $activeStep");
  }
}
