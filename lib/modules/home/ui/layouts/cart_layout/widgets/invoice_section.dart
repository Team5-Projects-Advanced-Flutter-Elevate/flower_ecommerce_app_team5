import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/colors/app_colors.dart';

class InvoiceSection extends StatefulWidget {
  const InvoiceSection({super.key, required this.cartResponseEntity});

  final CartResponseEntity cartResponseEntity;

  @override
  State<InvoiceSection> createState() => _InvoiceSectionState();
}

class _InvoiceSectionState extends BaseStatefulWidgetState<InvoiceSection> {
  CartCubit cubit = getIt<CartCubit>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Sub total',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16 * (screenWidth / 375),
                  color: AppColors.gray,
                ),
              ),
            ),
            const Spacer(),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Text(
                  'EGP ${state.totalPrice - 100}',
                  style: GoogleFonts.roboto(
                    textStyle: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16 * (screenWidth / 375),
                      color: AppColors.gray,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Row(
          children: [
            Text(
              'Delivery fee ',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16 * (screenWidth / 375),
                  color: AppColors.gray,
                ),
              ),
            ),
            const Spacer(),
            Text(
              'EGP 100',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16 * (screenWidth / 375),
                  color: AppColors.gray,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Divider(
          color: AppColors.gray,
        ),
        Row(
          children: [
            Text(
              'Total',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18 * (screenWidth / 375),
                ),
              ),
            ),
            const Spacer(),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) => Text(
                state.totalPrice.toString(),
                style: GoogleFonts.roboto(
                  textStyle: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18 * (screenWidth / 375),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
