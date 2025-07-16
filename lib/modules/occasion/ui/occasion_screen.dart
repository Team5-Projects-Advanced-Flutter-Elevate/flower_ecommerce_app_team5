import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/product_card.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../core/bases/base_stateful_widget_state.dart';
import '../../../core/di/injectable_initializer.dart';
import '../../../shared_layers/localization/generated/locale_keys.g.dart';
import 'occasion_cubit.dart';
import 'occasion_state.dart';

class OccasionListScreen extends StatefulWidget {
  const OccasionListScreen({super.key});

  @override
  State<OccasionListScreen> createState() => _OccasionListScreenState();
}

class _OccasionListScreenState
    extends BaseStatefulWidgetState<OccasionListScreen> {
  late HomeScreenViewModel homeScreenViewModel;
  late OccasionViewModelCubit viewModel;

  @override
  Widget build(BuildContext context) {
    homeScreenViewModel = Provider.of(context);
    return BlocProvider(
      create: (context) {
        viewModel = homeScreenViewModel.occasionViewModelCubit;
        viewModel.processIntent(LoadOccasionIntent());
        return viewModel;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            leadingWidth: screenWidth * 0.08,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 20, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.occasionScreenTitle.tr(),
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 2),
                Text(LocaleKeys.occasionScreenSubTitle.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.gray)),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          body: BlocBuilder<OccasionViewModelCubit, OccasionState>(
            builder: (context, state) {
              if (state is OccasionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is OccasionSuccess) {
                final allOccasions = state.allOccasions;
                final filteredProduct = state.filteredProducts;
                final selectedOccasionId = state.selectedId;

                final selectedIndex =
                    allOccasions.indexWhere((e) => e.id == selectedOccasionId);

                return DefaultTabController(
                  length: allOccasions.length,
                  initialIndex: selectedIndex == -1 ? 0 : selectedIndex,
                  child: Column(
                    children: [
                      TabBar(
                        // labelPadding: EdgeInsets.symmetric(horizontal: 2), // optional
                        physics: const BouncingScrollPhysics(),
                        isScrollable: true,
                        indicatorPadding: EdgeInsets.zero,
                        indicatorWeight: 2,
                        tabs: allOccasions.map((occasion) {
                          return Text(occasion.name ?? "");
                        }).toList(),
                        onTap: (index) {
                          final selectedOccasion = allOccasions[index];
                          context.read<OccasionViewModelCubit>().processIntent(
                                LoadFilterIntent(selectedOccasion.id ?? ""),
                              );
                        },
                      ),
                      filteredProduct.isEmpty
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 300),
                                child: Text('No Products Found'),
                              ),
                            )
                          : BlocListener<CartCubit, CartState>(
                              listener: (context, state) {
                                if (state.addToCartStatus ==
                                    AddToCartStatus.noAccess) {
                                  displayAlertDialog(
                                    title: Text(
                                      LocaleKeys.pleaseLoginFirst.tr(),
                                      textAlign: TextAlign.center,

                                    ),
                                    showOkButton: true,
                                    onOkButtonClick: () =>
                                        Navigator.pushReplacementNamed(
                                      context,
                                      DefinedRoutes.loginScreenRoute,
                                    ),
                                  );
                                  return;
                                }
                                if (state.addToCartStatus ==
                                    AddToCartStatus.success) {
                                  displayAlertDialog(
                                    title: Text(
                                      LocaleKeys.addedToCartSuccessfully.tr(),
                                      textAlign: TextAlign.center,

                                    ),
                                    isDismissible: true,
                                    autoDismissible: true,
                                  );
                                } else if (state.addToCartStatus ==
                                    AddToCartStatus.error) {
                                  displayAlertDialog(
                                    title: Text(
                                      LocaleKeys.soldOut.tr(),
                                      textAlign: TextAlign.center,

                                    ),
                                    isDismissible: true,
                                    autoDismissible: true,
                                  );
                                }

                              },
                              child: Expanded(
                                child: GridView.builder(
                                  itemCount: filteredProduct.length,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04,
                                    vertical: screenHeight * 0.01,
                                  ),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 163 / 229,
                                    mainAxisSpacing: 17,
                                    crossAxisSpacing: 17,
                                  ),
                                  itemBuilder: (context, index) {
                                    final product = filteredProduct[index];
                                    return BlocBuilder<CartCubit, CartState>(
                                      builder: (context, state) {
                                        var isLoading = state.addToCartStatus ==
                                                AddToCartStatus.loading &&
                                            state.addingProductId ==
                                                filteredProduct[index].id;
                                        var disabled = state.addToCartStatus ==
                                            AddToCartStatus.loading;
                                        return ProductCard(
                                          isLoading: isLoading,
                                          disabled: disabled,
                                          id: product.id,
                                          onProductCardClick: () {
                                            Navigator.pushNamed(
                                                context,
                                                DefinedRoutes
                                                    .productDetailsScreenRoute,
                                                arguments: product);
                                          },
                                          width: screenWidth * 0.45,
                                          height: screenHeight * 0.25,
                                          productTitle: '${product.title}',
                                          price: product.price,
                                          priceAfterDiscountIfExist:
                                              product.priceAfterDiscount,
                                          imageUrl: "${product.imgCover}",
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                    ],
                  ),
                );
              } else if (state is OccasionError) {
                return ErrorStateWidget(error: state.error);
              }
              return const SizedBox();
            },
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    homeScreenViewModel.occasionViewModelCubit.close();
    homeScreenViewModel.occasionViewModelCubit =
        getIt.get<OccasionViewModelCubit>();
  }
}
