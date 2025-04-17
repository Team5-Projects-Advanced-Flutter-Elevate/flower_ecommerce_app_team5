import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/widgets/search_and_feature_row.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/utilities/app_dialogs.dart';
import '../../../../../core/widgets/product_card.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';

class CategoriesLayout extends StatefulWidget {
  const CategoriesLayout({super.key});

  @override
  State<CategoriesLayout> createState() => _CategoriesLayoutState();
}

class _CategoriesLayoutState extends BaseStatefulWidgetState<CategoriesLayout> {
  late CategoriesLayoutViewModel viewModel;
  late HomeScreenViewModel homeScreenViewModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeScreenViewModel = Provider.of(context);
    viewModel = homeScreenViewModel.categoriesLayoutViewModel;
    viewModel.processIntent(GetCategoriesIntent());
  }

  //final List<String> tabs = [Constants.all];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          toolbarHeight: screenHeight * 0.1,
          title:  const SearchAndFilterRow(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight - 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: BlocConsumer<CategoriesLayoutViewModel,
                      CategoriesLayoutViewModelState>(
                  listener: (context, state) {
                    if (state is CategoriesLayoutViewModelError) {
                      displayAlertDialog(
                          showOkButton: true,
                          title: ErrorStateWidget(error: state.error));
                    }
                  },
                  buildWhen: (previous, current) =>
                      current is CategoriesLayoutViewModelSuccess,
                  builder: (context, state) {
                    if (state is CategoriesLayoutViewModelSuccess ||
                        state is CategoriesViewModelTabBarChanged) {
                      viewModel.processIntent(GetInitialCategoryIndex());
                      viewModel.processIntent(GetProductsIntent(
                          categoryId: viewModel.selectedCategoryId));
                      //tabs.addAll(viewModel.categoriesList.map((e) => e.name!));
                      return DefaultTabController(
                        length: viewModel.categoriesList.length,
                        initialIndex: viewModel.initialCategoryIndex,
                        child: TabBar(
                          onTap: (value) {
                            // if (value == 0) {
                            //   viewModel.processIntent(
                            //       TabBarChangedIntent(categoryId: null));
                            // }
                            viewModel.processIntent(TabBarChangedIntent(
                                categoryId:
                                    viewModel.categoriesList[value].id));
                          },
                          physics: const BouncingScrollPhysics(),
                          isScrollable: true,
                          indicatorPadding: EdgeInsets.zero,
                          indicatorWeight: 2,
                          tabs: viewModel.categoriesList
                              .map((title) => Text(title.name ?? ""))
                              .toList(),
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
            CategoriesLayoutViewModelState>(listener: (context, state) {
          if (state is CategoriesLayoutViewModelError) {
            displayAlertDialog(
                showOkButton: true,
                title: ErrorStateWidget(error: state.error));
          }
        }, builder: (context, state) {
          if (state is CategoriesViewModelTabBarChanged) {
            return CategoryProductsView(
              viewModel.productsList,
            );
          } else {
            return const LoadingWidget();
          }
        }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    homeScreenViewModel.categoriesLayoutViewModel.close();
    homeScreenViewModel.categoriesLayoutViewModel =
        getIt.get<CategoriesLayoutViewModel>();
  }
}
class CategoryProductsView extends BaseStatelessWidget {
  final List<ProductEntity> productList;

   const CategoryProductsView(this.productList, {super.key});

  @override
  Widget customBuild(BuildContext context,inherit) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state.addToCartStatus == AddToCartStatus.noAccess) {
          displayAlertDialog(
            title: Text(
              LocaleKeys.pleaseLoginFirst.tr(),
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
              message: LocaleKeys.addedToCartSuccessfully.tr(),
              isSuccess: true,
            );
          case AddToCartStatus.error:
            hideAlertDialog(context);
            AppDialogs.showMessage(
              context,
              message: LocaleKeys.soldOut.tr(),
              isSuccess: false,
            );
          case AddToCartStatus.initial:
          case AddToCartStatus.noAccess:
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: inherit.screenWidth * 0.04,
                  vertical: inherit.screenHeight * 0.01,
                ),
                child: productList.isEmpty
                    ? Center(
                        child: Text(
                          LocaleKeys.noProductsFound.tr(),
                          style: GoogleFonts.inter(
                              textStyle: inherit.theme.textTheme.bodyLarge!
                                  .copyWith(color: AppColors.white[70])),
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.only(top: inherit.screenHeight * 0.02),
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
                          width: inherit.screenWidth * 0.45,
                          height: inherit.screenHeight * 0.25,
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
