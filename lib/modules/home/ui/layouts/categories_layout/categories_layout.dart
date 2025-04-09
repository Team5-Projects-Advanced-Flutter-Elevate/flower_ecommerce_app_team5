import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';
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

  late final List<String> tabs = ['All'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesLayoutViewModel,
            CategoriesLayoutViewModelState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is CategoriesLayoutViewModelError) {
            displayAlertDialog(
                showOkButton: true, title: ErrorWidget(state.error));
          }
        },
        builder: (context, state) {
          if (state is CategoriesLayoutViewModelSuccess) {
            tabs.addAll(viewModel.categoriesList.map((e) => e.name!));
            return Scaffold(
              appBar: AppBar(
                forceMaterialTransparency: true,
                toolbarHeight: screenHeight * 0.1,
                title: _buildSearchAndFilterRow(),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight - 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: DefaultTabController(
                      length: tabs.length,
                      child: TabBar(
                        physics: const BouncingScrollPhysics(),
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorColor: AppColors.mainColor,
                        labelColor: AppColors.mainColor,
                        unselectedLabelColor:
                            AppColors.white[70], // Use your grey color
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
                    ),
                  ),
                ),
              ),
              body: CategoryProductsView(
                categoryId: null,
              ),
            );
          } else {
            return const Scaffold(
              body: Center(child: LoadingWidget()),
            );
          }
        });
  }

  Widget _buildSearchAndFilterRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: LocaleKeys.search,
              hintStyle: GoogleFonts.inter(
                textStyle: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 14 * (screenWidth / Constants.designWidth),
                  color: AppColors.white[70],
                ),
              ),
              prefixIcon: Icon(Icons.search, color: AppColors.white[70]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.white[70]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.white[70]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.mainColor),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20 * (screenWidth / Constants.designWidth),
            vertical: 13 * (screenWidth / Constants.designWidth),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white[70]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.sort_sharp, color: AppColors.white[70]),
        ),
      ],
    );
  }
}

class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView({
    super.key,
    this.categoryId,
  });
  final String? categoryId;
  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState
    extends BaseStatefulWidgetState<CategoryProductsView> {
  var viewModel = getIt.get<CategoriesLayoutViewModel>();
  @override
  void initState() {
    viewModel.processIntent(GetProductsIntent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.01,
            ),
            child: BlocConsumer<CategoriesLayoutViewModel,
                CategoriesLayoutViewModelState>(
              bloc: viewModel,
              listener: (context, state) {
                if (state is CategoriesLayoutViewModelError) {
                  displayAlertDialog(
                      showOkButton: true, title: ErrorWidget(state.error));
                }
              },
              builder: (context, state) {
                if (state is CategoriesLayoutViewModelSuccess) {
                  List<Products> productList = viewModel.productsList;
                  return GridView.builder(
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
                      onProductCardClick: () {},
                      onAddToCartButtonClick: () {},
                      width: screenWidth * 0.45,
                      height: screenHeight * 0.25,
                      productTitle: productList[index].title!,
                      price: productList[index].price,
                      priceAfterDiscountIfExist:
                          productList[index].priceAfterDiscount,
                      imageUrl: productList[index].imgCover ?? '',
                    ),
                  );
                } else {
                  return const Center(child: LoadingWidget());
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
