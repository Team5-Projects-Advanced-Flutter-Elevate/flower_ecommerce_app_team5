import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../core/colors/app_colors.dart';

class PaymentItem extends StatefulWidget {
  const PaymentItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<PaymentItem> createState() => _PaymentItemState();
}

class _PaymentItemState extends BaseStatefulWidgetState<PaymentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.white[90]!.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  textStyle: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 12 * (screenWidth / 375),
                  ),
                ),
              ),
              const Spacer(),
              BlocBuilder<CheckOutCubit, CheckOutState>(
                builder: (context, state) {
                  return Radio(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: widget.title,
                    groupValue: state.selectedPaymentMethod,
                    onChanged: (val) {
                      context.read<CheckOutCubit>().doIntent(
                            ChangePaymentIntent(
                              paymentMethod: widget.title,
                            ),
                          );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
