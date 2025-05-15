import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_inherited_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/track_order/ui/widgets/car_image.dart';
import 'package:flower_ecommerce_app_team5/modules/track_order/ui/widgets/driver_information.dart';
import 'package:flower_ecommerce_app_team5/modules/track_order/ui/widgets/estimated_arrival.dart';
import 'package:flower_ecommerce_app_team5/modules/track_order/ui/widgets/order_time_line.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import '../../../core/bases/base_statless_widget.dart';

class TrackOrderView extends BaseStatelessWidget {
  const TrackOrderView({super.key});

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.trackOrder.tr(),
        ),
        leading: IconButton(
          onPressed: () {},
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              flex: 3,
              child: EstimatedArrival(),
            ),
            const Expanded(
              flex: 2,
              child: DriverInformation(),
            ),
            SizedBox(
              height: inherit.screenHeight * 0.03,
            ),
            const Expanded(
              flex: 3,
              child: CarImage(),
            ),
            const Expanded(
              flex: 12,
              child: OrderTimeLine(),
            ),
            FilledButton(
              onPressed: () {},
              child: Text(
                LocaleKeys.showMap.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
