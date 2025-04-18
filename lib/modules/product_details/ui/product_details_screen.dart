import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/cached_image.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/view_model/product_details_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/view_model/product_details_state.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/view_model/product_details_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/routing/defined_routes.dart';
import '../../../core/utilities/app_dialogs.dart';
import '../../home/data/models/cart_response/add_to_cart_request.dart';
import '../../home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import '../../home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity productEntity;

  const ProductDetailsScreen({super.key, required this.productEntity});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends BaseStatefulWidgetState<ProductDetailsScreen> {
  final ProductDetailsViewModel productDetailsViewModel =
      getIt.get<ProductDetailsViewModel>();

  @override
  void initState() {
    super.initState();
    productDetailsViewModel.doIntent(
        ExtractColorPalettes(imageUrls: widget.productEntity.images ?? []));
    productDetailsViewModel.doIntent(InitOnScrollListener());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => productDetailsViewModel,
        child: Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: screenHeight * 0.5,
                      width: screenWidth,
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
                        child: BlocBuilder<ProductDetailsViewModel,
                            ProductDetailsState>(
                          buildWhen: (previous, current) {
                            if (previous.colorPalettesStatus !=
                                current.colorPalettesStatus) {
                              return true;
                            }
                            return false;
                          },
                          builder: (context, state) {
                            switch (state.colorPalettesStatus) {
                              case ColorPalettesStatus.idle:
                              case ColorPalettesStatus.loading:
                                return const LoadingWidget();
                              case ColorPalettesStatus.loaded:
                                WidgetsBinding.instance.addPostFrameCallback(
                                  (timeStamp) {
                                    productDetailsViewModel
                                        .doIntent(InitScrollStep());
                                  },
                                );
                                return Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    ListView.builder(
                                      itemCount:
                                          widget.productEntity.images?.length ??
                                              0,
                                      scrollDirection: Axis.horizontal,
                                      physics: const PageScrollPhysics(),
                                      controller: productDetailsViewModel
                                          .imageListController,
                                      itemBuilder: (context, index) {
                                        return CachedImage(
                                          url: widget.productEntity
                                                  .images?[index] ??
                                              "",
                                          width: screenWidth,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      child: ValueListenableBuilder(
                                        valueListenable: productDetailsViewModel
                                            .activeIndexOfSmoothIndicatorNotifier,
                                        builder: (context, value, child) {
                                          return AnimatedSmoothIndicator(
                                              effect: WormEffect(
                                                  activeDotColor:
                                                      AppColors.mainColor,
                                                  dotColor:
                                                      AppColors.white[70]!,
                                                  dotHeight:
                                                      screenHeight * 0.015,
                                                  dotWidth:
                                                      screenHeight * 0.015),
                                              activeIndex: value,
                                              onDotClicked: (index) {
                                                productDetailsViewModel
                                                    .doIntent(JumpToImageIndex(
                                                        index: index));
                                              },
                                              count: widget.productEntity.images
                                                      ?.length ??
                                                  0);
                                        },
                                      ),
                                    )
                                  ],
                                );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text(
                                LocaleKeys.egp.tr(args: [
                                  '${widget.productEntity.priceAfterDiscount ?? widget.productEntity.price ?? 0}'
                                ]),
                                style: theme.textTheme.headlineMedium,
                              ),
                              const Spacer(),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: LocaleKeys.status.tr(),
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w500)),
                                  TextSpan(
                                      text: (widget.productEntity.quantity !=
                                                  null &&
                                              (widget.productEntity.quantity! >
                                                  0)
                                          ? LocaleKeys.inStock.tr()
                                          : LocaleKeys.notInStock.tr()),
                                      style: theme.textTheme.bodyMedium)
                                ]),
                              ),
                            ],
                          ),
                          Text(
                            LocaleKeys.pricesIncludeTax.tr(),
                            textAlign: TextAlign.start,
                            style: theme.textTheme.bodySmall,
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Text(
                            widget.productEntity.title ?? "",
                            textAlign: TextAlign.start,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '${LocaleKeys.description.tr()}\n',
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: widget.productEntity.description ?? "",
                                  style: theme.textTheme.bodyMedium)
                            ]),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '${LocaleKeys.information.tr()}\n',
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: LocaleKeys.sold.tr(args: [
                                    "${widget.productEntity.sold ?? ""}\n"
                                  ]),
                                  style: theme.textTheme.bodyMedium),
                              TextSpan(
                                  text: LocaleKeys.rate.tr(args: [
                                    "${widget.productEntity.rateAvg ?? ""}"
                                  ]),
                                  style: theme.textTheme.bodyMedium),
                              const WidgetSpan(
                                  child: Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                                size: 18,
                              )),
                              TextSpan(
                                  text: "\n${LocaleKeys.rateCount.tr(args: [
                                        "${widget.productEntity.rateCount ?? ""}\n"
                                      ])}",
                                  style: theme.textTheme.bodyMedium)
                            ]),
                          ),
                          FilledButton(
                              onPressed: () {
                                getIt<CartCubit>().doIntent(
                                  AddToCartIntent(
                                    request: AddToCartRequest(
                                      product: widget.productEntity.id!,
                                      quantity: 1,
                                    ),
                                  ),
                                );
                              },
                              child: Text(LocaleKeys.addToCart.tr()))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.white, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    alignment: Alignment.center,
                    hoverColor: Colors.transparent,
                    padding: const EdgeInsets.only(left: 8),
                  ),
                ),
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
    productDetailsViewModel.doIntent(DisposeScrollController());
  }
}
