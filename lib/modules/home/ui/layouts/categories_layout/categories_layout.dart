import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import 'package:flower_ecommerce_app_team5/core/constants/constants.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/widgets/search_and_feature_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/routing/defined_routes.dart';
import '../../../../../core/utilities/app_dialogs.dart';
import '../../../../../core/widgets/product_card.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../../../data/models/all_products_response/all_product_response.dart';

class CategoriesLayout extends StatefulWidget {
  const CategoriesLayout({super.key});

  @override
  State<CategoriesLayout> createState() => _CategoriesLayoutState();
}

class _CategoriesLayoutState extends BaseStatefulWidgetState<CategoriesLayout> {
  CategoriesLayoutViewModel viewModel = getIt.get<CategoriesLayoutViewModel>();

  @override
  void initState() {
    viewModel.processIntent(GetCategoriesIntent());

    super.initState();
  }

  final List<String> tabs = [Constants.all];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: screenHeight * 0.1,
        title: SearchAndFilterRow(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight - 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: BlocConsumer<CategoriesLayoutViewModel,
                    CategoriesLayoutViewModelState>(
                bloc: viewModel,
                listener: (context, state) {
                  if (state is CategoriesLayoutViewModelError) {
                    displayAlertDialog(
                        showOkButton: true, title: ErrorWidget(state.error));
                  }
                },
                buildWhen: (previous, current) =>
                    current is CategoriesLayoutViewModelSuccess,
                builder: (context, state) {
                  if (state is CategoriesLayoutViewModelSuccess ||
                      state is CategoriesViewModelTabBarChanged) {
                    viewModel.processIntent(GetProductsIntent());
                    tabs.addAll(viewModel.categoriesList.map((e) => e.name!));
                    return DefaultTabController(
                      length: tabs.length,
                      child: TabBar(
                        onTap: (value) {
                          if (value == 0) {
                            viewModel.processIntent(
                                TabBarChangedIntent(categoryId: null));
                          }

                          viewModel.processIntent(TabBarChangedIntent(
                              categoryId: ((value - 1) >= 0)
                                  ? viewModel.categoriesList[value - 1].id
                                  : null));
                        },
                        physics: const BouncingScrollPhysics(),
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorColor: AppColors.mainColor,
                        labelColor: AppColors.mainColor,
                        unselectedLabelColor: AppColors.white[70],
                        // Use your grey color
                        labelStyle: theme.textTheme.bodyLarge,
                        unselectedLabelStyle: GoogleFonts.inter(
                            textStyle: theme.textTheme.bodyLarge),
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        indicatorWeight: 2,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: tabs.map((title) => Text(title)).toList(),
                      ),
                    );
                  } else {
                    return const LoadingWidget();
                  }
                }),
          ),
        ),
      ),
      body: BlocConsumer<CategoriesLayoutViewModel,
              CategoriesLayoutViewModelState>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is CategoriesLayoutViewModelError) {
              displayAlertDialog(
                  showOkButton: true, title: ErrorWidget(state.error));
            }
          },
          builder: (context, state) {
            if (state is CategoriesViewModelTabBarChanged) {
              return CategoryProductsView(
                viewModel.productsList,
              );
            } else {
              return const LoadingWidget();
            }
          }),
    );
  }
}

class CategoryProductsView extends BaseStatelessWidget {
  final List<Products> productList;

  CategoryProductsView(this.productList, {super.key});

  @override
  Widget customBuild(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state.status == CartStatus.noAccess) {
          displayAlertDialog(
            title: const Text(
              'please login first',
            ),
            showOkButton: true,
            onOkButtonClick: () => Navigator.pushReplacementNamed(
              context,
              DefinedRoutes.loginScreenRoute,
            ),
            context: context,
          );
          return;
        }
        switch (state.addToCartStatus) {
          case AddToCartStatus.loading:
            displayAlertDialog(
              context: context,
              title: const LoadingWidget(),
            );
          case AddToCartStatus.success:
            hideAlertDialog(context);
            AppDialogs.showMessage(
              context,
              message: 'Added to cart successfully',
              isSuccess: true,
            );
          case AddToCartStatus.error:
            hideAlertDialog(context);
            AppDialogs.showMessage(
              context,
              message: 'Sold out',
              isSuccess: false,
            );
          case AddToCartStatus.initial:
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.01,
                ),
                child: productList.isEmpty
                    ? Center(
                        child: Text(
                          LocaleKeys.noProductsFound.tr(),
                          style: GoogleFonts.inter(
                              textStyle: theme.textTheme.bodyLarge!
                                  .copyWith(color: AppColors.white[70])),
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        itemCount: productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 163 / 229,
                          mainAxisSpacing: 17,
                          crossAxisSpacing: 17,
                        ),
                        itemBuilder: (context, index) => ProductCard(
                          id: productList[index].id,
                          onProductCardClick: () {},
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.25,
                          productTitle: productList[index].title!,
                          price: productList[index].price,
                          priceAfterDiscountIfExist:
                              productList[index].priceAfterDiscount,
                          imageUrl: productList[index].imgCover ?? '',
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}
