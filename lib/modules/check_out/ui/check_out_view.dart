import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_state.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/widgets/delivery_address_section.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/widgets/gift_section.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/widgets/payment_section.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/widgets/place_order_section.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartResponseEntity});

  final CartResponseEntity cartResponseEntity;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends BaseStatefulWidgetState<CheckOutView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CheckOutCubit>(context).state.makeCashOnDeliveryStatus =
        MakeCashOnDeliveryStatus.initial;
    BlocProvider.of<CheckOutCubit>(context).state.makeCreditCardStatus =
        MakeCreditCardStatus.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white[60],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          LocaleKeys.checkout.tr(),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                // Delivery Address Section
                SizedBox(
                  height: screenHeight * 0.48,
                  child: const DeliveryAddressSection(),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Payment Section
                SizedBox(
                  height: screenHeight * 0.31,
                  child: const PaymentSection(),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Gift Section
                const GiftSection(),
                SizedBox(height: screenHeight * 0.03),

                // Place Order Section
                Expanded(
                  child: PlaceOrderSection(
                    cartResponseEntity: widget.cartResponseEntity,
                  ),
                ),
                Container(
                  color: AppColors.white,
                  height: screenHeight * 0.05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
