import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import '../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/constants.dart';

class OrderTimeLine extends StatefulWidget {
  final List<String> timestamps;
  final int activeStep;

  const OrderTimeLine(
      {super.key, required this.timestamps, required this.activeStep});

  @override
  State<OrderTimeLine> createState() => _OrderTimeLineState();
}

class _OrderTimeLineState extends BaseStatefulWidgetState<OrderTimeLine> {
  final List<String> titles = [
    LocaleKeys.receivedYourOrder.tr(),
    LocaleKeys.preparingYourOrder.tr(),
    LocaleKeys.outForDelivery.tr(),
    LocaleKeys.delivered.tr(),
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: titles.length,
      itemBuilder: (context, index) {
        final isFirst = index == 0;
        final isLast = index == titles.length - 1;
        final isActive = index <= widget.activeStep;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                if (!isFirst)
                  Container(
                    width: 1,
                    height: screenHeight * 0.02,
                    color: AppColors.gray,
                  ),
                // Circle
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor:
                          isActive ? AppColors.mainColor : AppColors.gray,
                    ),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: AppColors.white,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          isActive ? AppColors.mainColor : AppColors.white,
                    ),
                  ],
                ),
                if (!isLast)
                  Container(
                    width: 1,
                    height: screenHeight * 0.08, // Match text height
                    color: AppColors.gray,
                  ),
              ],
            ),
            SizedBox(
              width: screenWidth * 0.04,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titles[index],
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 12 * (screenWidth / Constants.designWidth),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.timestamps[index],
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.gray,
                      fontSize: 10 * (screenWidth / Constants.designWidth),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  } // ou can make this dynamic
}
