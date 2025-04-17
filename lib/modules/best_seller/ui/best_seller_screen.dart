import 'dart:io';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/constants/assets_paths.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/app_dialogs.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/product_card.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/view_model/best_seller_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/view_model/best_seller_state.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/view_model/best_seller_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/routing/defined_routes.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends BaseStatefulWidgetState<BestSellerScreen> {
  BestSellerViewModel bestSellerViewModel = getIt.get<BestSellerViewModel>();

  @override
  void initState() {
    super.initState();
    bestSellerViewModel.doIntent(GetBestSellerProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bestSellerViewModel,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leadingWidth: screenWidth * 0.08,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Column(
            crossAxisAlignment: Platform.isIOS
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.bestSeller.tr(),
                style: theme.textTheme.labelMedium,
              ),
              Text(
                LocaleKeys.bloomWithBestSeller.tr(),
                style: theme.textTheme.labelSmall!.copyWith(
                    color: AppColors.gray, fontSize: 13 * (screenWidth / 375)),
              ),
            ],
          ),
        ),
        // GestureDetector prevents the custom refresh indicator from appearing when just clicking on the screen and not pulling down
        body: GestureDetector(
          onTap: () {},
          child: CustomMaterialIndicator(
            backgroundColor: AppColors.white,
            indicatorBuilder: (context, controller) {
              return Transform.scale(
                scale: 1.2,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  padding: const EdgeInsets.only(top: 6),
                  child: Center(
                    child: Transform.scale(
                      scale: 1.5,
                      child: Lottie.asset(
                        AssetsPaths.flowerLoadingAnimation,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              );
            },
            onRefresh: () {
              return bestSellerViewModel.doIntent(GetBestSellerProducts());
            },
            child: BlocListener<CartCubit, CartState>(
              listenWhen: (previous, current) =>
                  current.addToCartStatus != previous.addToCartStatus,
              listener: (context, state) {
                if (state.addToCartStatus == AddToCartStatus.noAccess) {
                  displayAlertDialog(
                    title:  Text(
                      LocaleKeys.pleaseLoginFirst.tr(),
                    ),
                    showOkButton: true,
                    onOkButtonClick: () => Navigator.pushReplacementNamed(
                      context,
                      DefinedRoutes.loginScreenRoute,
                    ),
                  );
                  return;
                }
                switch (state.addToCartStatus) {
                  case AddToCartStatus.loading:
                    Future.delayed(Duration.zero, () {
                      displayAlertDialog(
                        title: const LoadingWidget(),
                      );
                    });

                  case AddToCartStatus.success:
                    Future.delayed(Duration.zero, () {
                      hideAlertDialog();
                      AppDialogs.showMessage(
                        context,
                        message: LocaleKeys.addedToCartSuccessfully.tr(),
                        isSuccess: true,
                      );
                    });

                  case AddToCartStatus.error:
                    Future.delayed(Duration.zero, () {
                      hideAlertDialog();
                      AppDialogs.showMessage(
                        context,
                        message: LocaleKeys.soldOut.tr(),
                        isSuccess: false,
                      );
                    });

                  case AddToCartStatus.initial:
                  case AddToCartStatus.noAccess:
                }
              },
              child: BlocBuilder<BestSellerViewModel, BestSellerState>(
                builder: (context, state) {
                  switch (state.bestSellerStatus) {
                    case BestSellerStatus.initial:
                      return const SizedBox();
                    case BestSellerStatus.loading:
                      return const CustomScrollView(slivers: [
                        SliverFillRemaining(child: LoadingWidget())
                      ]);
                    case BestSellerStatus.success:
                      var bestSellerProducts = state.bestSellerProducts ?? [];
                      if (bestSellerProducts.isEmpty) {
                        return Center(
                            child: Text(
                          LocaleKeys.noProducts.tr(),
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 20 * (screenWidth / 375)),
                        ));
                      }
                      return Material(
                        color: AppColors.white,
                        child: GridView.builder(
                          itemCount: bestSellerProducts.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.01),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 163 / 229,
                                  mainAxisSpacing: 17,
                                  crossAxisSpacing: 17),
                          itemBuilder: (context, index) {
                            return ProductCard(
                                onProductCardClick: () {},
                                id: bestSellerProducts[index].id,
                                width: screenWidth * 0.45,
                                height: screenHeight * 0.25,
                                productTitle:
                                    bestSellerProducts[index].title ?? "",
                                price: bestSellerProducts[index].price,
                                priceAfterDiscountIfExist:
                                    bestSellerProducts[index]
                                        .priceAfterDiscount,
                                imageUrl:
                                    bestSellerProducts[index].imgCover ?? "");
                          },
                        ),
                      );
                    case BestSellerStatus.error:
                      return CustomScrollView(slivers: [
                        SliverFillRemaining(
                            child: ErrorStateWidget(error: state.error!))
                      ]);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
