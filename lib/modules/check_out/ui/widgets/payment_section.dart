import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/widgets/payment_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../shared_layers/localization/generated/locale_keys.g.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends BaseStatefulWidgetState<PaymentSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.3,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: Text(
              LocaleKeys.paymentMethod.tr(),
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 14 * (screenWidth / 375),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          PaymentItem(
            title: LocaleKeys.cashOnDelivery.tr(),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          PaymentItem(
            title: LocaleKeys.creditCard.tr(),
          ),
        ],
      ),
    );
  }
}
