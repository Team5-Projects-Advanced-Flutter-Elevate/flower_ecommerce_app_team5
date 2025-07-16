import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/widgets/category_products_view.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/widgets/show_sort_bottom_sheet.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/widgets/sort_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';

class CategoriesLayout extends StatefulWidget {
  const CategoriesLayout({super.key});

  @override
  State<CategoriesLayout> createState() => _CategoriesLayoutState();
}

class _CategoriesLayoutState extends BaseStatefulWidgetState<CategoriesLayout> {
  late CategoriesLayoutViewModel categoriesViewModel;
  HomeScreenViewModel homeScreenViewModel = getIt.get<HomeScreenViewModel>();

  bool isFirstTime = true;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    categoriesViewModel = homeScreenViewModel.categoriesLayoutViewModel;
    categoriesViewModel.processIntent(GetCategoriesIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoriesViewModel,
      child: BlocConsumer<CategoriesLayoutViewModel,
          CategoriesLayoutViewModelState>(
        listener: (context, state) {
          if (isFirstTime && state.getCategoriesStatus == Status.success) {
            isFirstTime = false;
            categoriesViewModel.processIntent(GetProductsIntent(
              categoryId: state.categories[0].id!,
            ));
          }
        },
        builder: (context, state) {
          switch (state.getCategoriesStatus) {
            case Status.initial:
            case Status.loading:
              return const LoadingWidget();
            case Status.success:
              return Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton:
                    SortWidget(viewModel: categoriesViewModel),
                appBar: AppBar(
                  forceMaterialTransparency: true,
                  toolbarHeight: screenHeight * 0.1,
                  title: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DefinedRoutes.searchScreenRoute,
                            );
                          },
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.search,
                              hintStyle: GoogleFonts.inter(
                                textStyle: theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 14 *
                                      (screenWidth / Constants.designWidth),
                                  color: AppColors.white[70],
                                ),
                              ),
                              prefixIcon: Icon(Icons.search,
                                  color: AppColors.white[70]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: AppColors.white[70]!),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: AppColors.white[70]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: AppColors.mainColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          showSortBottomSheet(
                              screenHeight: screenHeight,
                              viewModel: categoriesViewModel,
                              context: context,
                              theme: theme,
                              screenWidth: screenWidth);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                20 * (screenWidth / Constants.designWidth),
                            vertical:
                                13 * (screenWidth / Constants.designWidth),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white[70]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.sort_sharp,
                              color: AppColors.white[70]),
                        ),
                      ),
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight - 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: DefaultTabController(
                          length: state.categories.length,
                          initialIndex:
                              categoriesViewModel.initialCategoryIndex,
                          child: TabBar(
                            onTap: (value) {
                              if (currentIndex == value) return;
                              categoriesViewModel
                                  .processIntent(GetProductsIntent(
                                categoryId: state.categories[value].id!,
                              ));
                              categoriesViewModel.selectedCategoryId =
                                  state.categories[value].id!;
                              currentIndex = value;
                            },
                            physics: const BouncingScrollPhysics(),
                            isScrollable: true,
                            indicatorPadding: EdgeInsets.zero,
                            indicatorWeight: 2,
                            tabs: state.categories
                                .map((title) => Text(title.name ?? ""))
                                .toList(),
                          ),
                        )),
                  ),
                ),
                body: BlocBuilder<CategoriesLayoutViewModel,
                    CategoriesLayoutViewModelState>(
                  builder: (context, state) {
                    switch (state.getProductsStatus) {
                      case Status.initial:
                      case Status.loading:
                        return const LoadingWidget();
                      case Status.success:
                        return CategoryProductsView(
                          state.products,
                        );
                      case Status.error:
                        return ErrorStateWidget(error: state.getProductsError!);
                    }
                  },
                ),
              );
            case Status.error:
              return ErrorStateWidget(error: state.getCategoriesError!);
          }
        },
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
