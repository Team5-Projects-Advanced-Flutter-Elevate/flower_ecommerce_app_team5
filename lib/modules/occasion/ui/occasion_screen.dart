import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/product_card.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bases/base_stateful_widget_state.dart';
import '../../../core/di/injectable_initializer.dart';
import '../../../core/routing/defined_routes.dart';
import '../../../core/utilities/app_dialogs.dart';
import '../../../core/widgets/loading_state_widget.dart';
import '../../../shared_layers/localization/generated/locale_keys.g.dart';
import 'occasion_cubit.dart';
import 'occasion_state.dart';

class OcassionListScreen extends StatefulWidget {
  const OcassionListScreen({super.key});

  @override
  State<OcassionListScreen> createState() => _OcassionListScreenState();
}

class _OcassionListScreenState
    extends BaseStatefulWidgetState<OcassionListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late OcassionViewModelCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        viewModel = getIt.get<OcassionViewModelCubit>();
        viewModel.processIntent(LoadOccasionIntent());
        return viewModel;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        size: 20, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocaleKeys.occsionScreenTitle.tr(),
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
                ],
              ),
            ),
          ),
          body: BlocBuilder<OcassionViewModelCubit, OccasionState>(
            builder: (context, state) {
              if (state is OccasionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is OccasionSuccess) {
                final allOccasions = state.allOccasions;
                final filteredProduct = state.filteredProducts;
                final selectedOccasionId = state.selectedSlug;

                final selectedIndex =
                    allOccasions.indexWhere((e) => e.id == selectedOccasionId);

                return DefaultTabController(
                  length: allOccasions.length,
                  initialIndex: selectedIndex == -1 ? 0 : selectedIndex,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelColor: Colors.pink,
                        indicatorPadding: EdgeInsets.only(bottom: 7),
                        // labelPadding: EdgeInsets.symmetric(horizontal: 2), // optional

                        tabs: allOccasions.map((occasion) {
                          return Tab(
                            child: Column(
                              children: [
                                Text(occasion.name),
                              ],
                            ),
                          );
                        }).toList(),
                        onTap: (index) {
                          final selectedOccasion = allOccasions[index];
                          context.read<OcassionViewModelCubit>().processIntent(
                                LoadFilterIntent(selectedOccasion.id),
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
                                if (state.status == CartStatus.noAccess) {
                                  displayAlertDialog(
                                    title: Text(
                                      LocaleKeys.pleaseLoginFirst.tr(),
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
                                switch (state.addToCartStatus) {
                                  case AddToCartStatus.loading:
                                    displayAlertDialog(
                                      title: const LoadingWidget(),
                                    );
                                  case AddToCartStatus.success:
                                    hideAlertDialog();
                                    AppDialogs.showMessage(
                                      context,
                                      message: LocaleKeys
                                          .addedToCartSuccessfully
                                          .tr(),
                                      isSuccess: true,
                                    );
                                  case AddToCartStatus.error:
                                    hideAlertDialog();
                                    AppDialogs.showMessage(
                                      context,
                                      message: LocaleKeys.soldOut.tr(),
                                      isSuccess: false,
                                    );
                                  case AddToCartStatus.initial:
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
                                    return ProductCard(
                                      id: product.id,
                                      onProductCardClick: () {},
                                      width: screenWidth * 0.45,
                                      height: screenHeight * 0.25,
                                      productTitle: '${product.title}',
                                      price: product.price,
                                      priceAfterDiscountIfExist:
                                          product.priceAfterDiscount,
                                      imageUrl: "${product.images?[index]}",
                                    );
                                  },
                                ),
                              ),
                            )
                    ],
                  ),
                );
              } else if (state is OccasionError) {
                return Center(child: Text("Error: ${state.message}"));
              }
              return const SizedBox();
            },
          )),
    );
  }
}
