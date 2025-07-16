import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/ui/view_model/home_screen_view_model.dart';

class SuccessfulOrderPlacedScreen extends StatefulWidget {
  final String orderId;
  const SuccessfulOrderPlacedScreen({super.key, required this.orderId});

  @override
  State<SuccessfulOrderPlacedScreen> createState() => _SuccessfulOrderPlacedScreenState();
}

class _SuccessfulOrderPlacedScreenState extends BaseStatefulWidgetState<SuccessfulOrderPlacedScreen> {


  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info){
    onLoadingIconButtonClick();
    return true;
  }
  void onLoadingIconButtonClick(){
    Provider.of<HomeScreenViewModel>(context, listen: false)
        .setAppSectionsIndex(0);
    Navigator.pushNamedAndRemoveUntil(
      context,
      DefinedRoutes.homeScreenRoute,
          (route) => false,
    );
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("placed orderId: ${widget.orderId} --------");
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(LocaleKeys.trackOrder.tr()),
        leading: IconButton(
            onPressed: () {
              onLoadingIconButtonClick();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.06),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.vividGreen[10],
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(18),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.vividGreen[20],
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.vividGreen[30],
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.vividGreen,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.check_sharp,
                        size: screenWidth * 0.13,
                        weight: 40,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.orderPlacedSuccess.tr(),
                      style: theme.textTheme.titleLarge!.copyWith(
                        height: 1.5,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              FilledButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, DefinedRoutes.trackOrder,
                      arguments: widget.orderId);
                },
                child: Text(LocaleKeys.trackOrder.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    BackButtonInterceptor.remove(myInterceptor);
  }
}
