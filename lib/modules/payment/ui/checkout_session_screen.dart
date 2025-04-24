import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/constants/assets_paths.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/ui/view_model/payment_state.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/ui/view_model/payment_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutSessionScreen extends StatefulWidget {
  final PaymentRequestParametersEntity paymentRequestParameters;

  const CheckoutSessionScreen(
      {super.key, required this.paymentRequestParameters});

  @override
  State<CheckoutSessionScreen> createState() => _CheckoutSessionScreenState();
}

class _CheckoutSessionScreenState
    extends BaseStatefulWidgetState<CheckoutSessionScreen> {
  final PaymentViewModel paymentViewModel = getIt.get<PaymentViewModel>();

  @override
  void initState() {
    super.initState();
    paymentViewModel.doIntent(MakeCheckoutSessionIntent(
        paymentRequestParameters: widget.paymentRequestParameters));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => paymentViewModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          leading: IconButton(
              onPressed: () {
              Navigator.pop(context);
                },icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AssetsPaths.flowerIconWithBackground, width: 25),
              SizedBox(
                width: screenWidth * 0.01,
              ),
              Text(
                LocaleKeys.flowery.tr(),
                style: theme.textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                    fontFamily: GoogleFonts.imFellEnglish.toString()),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            BlocBuilder<PaymentViewModel, PaymentState>(
              builder: (context, state) {
                switch (state.checkoutSessionStatus) {
                  case PaymentStatus.initial:
                    return const SizedBox();
                  case PaymentStatus.loading:
                    return const LoadingWidget();
                  case PaymentStatus.success:
                    return InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: WebUri(
                            state.checkoutResponseEntity?.session?.url ?? ""),
                      ),
                      onUpdateVisitedHistory: (controller, url, isReload) {
                        if (("$url" ==
                                state.checkoutResponseEntity?.session
                                    ?.successUrl) &&
                            url != null) {
                          displayAlertDialog(
                            title: Text(LocaleKeys.successfulPayment.tr()),
                            showOkButton: true,
                            onOkButtonClick: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  DefinedRoutes.homeScreenRoute,
                                  (route) => false);
                            },
                          );
                        } else if (("$url" ==
                                state.checkoutResponseEntity?.session
                                    ?.cancelUrl) &&
                            url != null) {
                          displayAlertDialog(
                            title: Text(LocaleKeys.canceledPayment.tr()),
                            showOkButton: true,
                            onOkButtonClick: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  DefinedRoutes.homeScreenRoute,
                                  (route) => false);
                            },
                          );
                        }
                      },
                    );
                  case PaymentStatus.error:
                    return CustomScrollView(slivers: [
                      SliverFillRemaining(
                        child: ErrorStateWidget(error: state.error!),
                      )
                    ]);
                }
              },
            ),
          ])),
    );
  }
}
