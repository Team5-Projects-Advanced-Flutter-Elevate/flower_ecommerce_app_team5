import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/app_dialogs.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bases/base_inherited_widget.dart';
import '../../../../core/bases/base_statless_widget.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../../../home/domain/entities/cart_response_entity/cart_response_entity.dart';
import '../../../home/ui/layouts/cart_layout/widgets/invoice_section.dart';
import '../../../payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';

class PlaceOrderSection extends BaseStatelessWidget {
  const PlaceOrderSection({super.key, required this.cartResponseEntity});

  final CartResponseEntity cartResponseEntity;

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              InvoiceSection(
                cartResponseEntity: cartResponseEntity,
              ),
              SizedBox(
                height: inherit.screenHeight * 0.03,
              ),
            ],
          ),
          BlocConsumer<CheckOutCubit, CheckOutState>(
            listener: (context, state) {
              switch (state.makeCashOnDeliveryStatus) {
                case MakeCashOnDeliveryStatus.initial:
                  break;
                case MakeCashOnDeliveryStatus.loading:
                  displayAlertDialog(title: const LoadingWidget());
                case MakeCashOnDeliveryStatus.success:
                  hideAlertDialog();
                  Navigator.pushNamed(
                    context,
                    DefinedRoutes.trackOrder,
                  );
                case MakeCashOnDeliveryStatus.error:
                  displayAlertDialog(
                      title: ErrorStateWidget(error: state.error!));
              }
              switch (state.makeCreditCardStatus) {
                case MakeCreditCardStatus.initial:
                  break;
                case MakeCreditCardStatus.loading:
                  displayAlertDialog(title: const LoadingWidget());
                case MakeCreditCardStatus.success:
                  hideAlertDialog();
                  Navigator.pushNamed(
                      context, DefinedRoutes.checkoutSessionScreenRoute,
                      arguments: PaymentRequestParametersEntity(
                        shippingAddress: ShippingAddressEntity(
                          street: state.addressModelEntityOfSelectedAddress!
                                  .street ??
                              '',
                          phone: state
                                  .addressModelEntityOfSelectedAddress!.phone ??
                              '',
                          city:
                              state.addressModelEntityOfSelectedAddress!.city ??
                                  '',
                          lat: state.addressModelEntityOfSelectedAddress!.lat ??
                              '',
                          long:
                              state.addressModelEntityOfSelectedAddress!.long ??
                                  '',
                        ),
                      ));
                case MakeCreditCardStatus.error:
                  displayAlertDialog(
                      title: ErrorStateWidget(error: state.error!));
              }
            },
            builder: (context, state) {
              return FilledButton(
                onPressed: () {
                  if (state.selectedDeliveryAddress == null) {
                    AppDialogs.showMessage(
                      context,
                      message: LocaleKeys.pleaseSelectDeliveryAddress.tr(),
                      isSuccess: false,
                    );
                  } else if (state.selectedPaymentMethod == null) {
                    AppDialogs.showMessage(
                      context,
                      message: LocaleKeys.pleaseSelectPaymentMethod.tr(),
                      isSuccess: false,
                    );
                  } else {
                    if (state.selectedPaymentMethod ==
                        SelectedPaymentMethod.cod) {
                      cashOnDelivery(context, state);
                    } else if (state.selectedPaymentMethod ==
                        SelectedPaymentMethod.online) {
                      onlinePayment(context, state);
                    }
                  }
                },
                child: Text(
                  LocaleKeys.placeOrder.tr(),
                  style: inherit.theme.textTheme.labelMedium?.copyWith(
                    fontSize: 16 * (inherit.screenWidth / 375),
                    color: AppColors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void cashOnDelivery(BuildContext context, state) {
    context.read<CheckOutCubit>().doIntent(
          MakeCashOnDeliveryIntent(
            paymentRequestParameters: PaymentRequestParametersEntity(
              shippingAddress: ShippingAddressEntity(
                street: state.addressModelEntityOfSelectedAddress!.street ?? '',
                phone: state.addressModelEntityOfSelectedAddress!.phone ?? '',
                city: state.addressModelEntityOfSelectedAddress!.city ?? '',
                lat: state.addressModelEntityOfSelectedAddress!.lat ?? '',
                long: state.addressModelEntityOfSelectedAddress!.long ?? '',
              ),
            ),
          ),
        );
  }

  void onlinePayment(BuildContext context, state) {
    context.read<CheckOutCubit>().doIntent(
          MakeOnlinePaymentIntent(
            paymentRequestParameters: PaymentRequestParametersEntity(
              shippingAddress: ShippingAddressEntity(
                street: state.addressModelEntityOfSelectedAddress!.street ?? '',
                phone: state.addressModelEntityOfSelectedAddress!.phone ?? '',
                city: state.addressModelEntityOfSelectedAddress!.city ?? '',
                lat: state.addressModelEntityOfSelectedAddress!.lat ?? '',
                long: state.addressModelEntityOfSelectedAddress!.long ?? '',
              ),
            ),
          ),
        );
  }
}
