import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/cached_image.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/view_model/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  int scrollStep = 0;
  late final ScrollController imageListController;

  @override
  void initState() {
    super.initState();
    imageListController = ScrollController();
    imageListController.addListener(
      () {
        if (imageListController.position.pixels % scrollStep == 0) {
          int activeIndex = imageListController.position.pixels ~/ scrollStep;
          productDetailsViewModel.setActiveIndexOfSmoothIndicator(activeIndex);
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (scrollStep == 0) {
          scrollStep = imageListController.position.maxScrollExtent ~/
              ((widget.productEntity.images?.length ?? 1) - 1);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => productDetailsViewModel,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.5,
                          width: screenWidth,
                          child: ListView.builder(
                            itemCount: widget.productEntity.images?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            physics: const PageScrollPhysics(),
                            controller: imageListController,
                            itemBuilder: (context, index) {
                              return CachedImage(
                                url: widget.productEntity.images?[index] ?? "",
                                width: screenWidth,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          child: ValueListenableBuilder(
                            valueListenable: productDetailsViewModel
                                .activeIndexOfSmoothIndicator,
                            builder: (context, value, child) {
                              return AnimatedSmoothIndicator(
                                  effect: WormEffect(
                                      activeDotColor: AppColors.mainColor,
                                      dotColor: AppColors.white[70]!,
                                      dotHeight: screenHeight * 0.015,
                                      dotWidth: screenHeight * 0.015),
                                  activeIndex: value,
                                  onDotClicked: (index) {
                                    imageListController.jumpTo(
                                        (index * scrollStep).toDouble());
                                  },
                                  count:
                                      widget.productEntity.images?.length ?? 0);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Text(
                                "EGP ${widget.productEntity.priceAfterDiscount ?? widget.productEntity.price ?? 0}",
                                style: theme.textTheme.headlineMedium,
                              ),
                              const Spacer(),
                              RichText(text: TextSpan(children: [
                                TextSpan(text: '')
                              ]),),
                              Text((widget.productEntity.quantity != null &&
                                      (widget.productEntity.quantity! > 0)
                                  ? "Status: in stock"
                                  : "Status: not in stock")),
                            ],
                          ),
                        )
                      ],
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
}
