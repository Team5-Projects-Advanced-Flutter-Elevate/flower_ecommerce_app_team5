import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
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
import 'package:provider/provider.dart';

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
  late HomeScreenViewModel homeScreenViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeScreenViewModel = Provider.of(context);
    categoriesViewModel = homeScreenViewModel.categoriesLayoutViewModel;
    categoriesViewModel.processIntent(GetCategoriesIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoriesViewModel,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              toolbarHeight: screenHeight * 0.1,
              title: Row(
                children: [
                  Expanded(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: LocaleKeys.search,
                        hintStyle: GoogleFonts.inter(
                          textStyle: theme.textTheme.bodyMedium!.copyWith(
                            fontSize:
                                14 * (screenWidth / Constants.designWidth),
                            color: AppColors.white[70],
                          ),
                        ),
                        prefixIcon:
                            Icon(Icons.search, color: AppColors.white[70]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.white[70]!),
                        ),
                        disabledBorder: OutlineInputBorder(
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
                  InkWell(
                    onTap: () {
                      showSortBottomSheet(
                          viewModel: categoriesViewModel,
                          context: context,
                          theme: theme,
                          screenWidth: screenWidth);
                    },
                    child: Container(
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
                  ),
                ],
              ),
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
                  }, buildWhen: (previous, current) {
                    return current is CategoriesLayoutViewModelSuccess;
                  }, builder: (context, state) {
                    // if(state is ChangeFilterRadioButton) return;
                    if (state is CategoriesLayoutViewModelSuccess ||
                        state is CategoriesViewModelTabBarChanged) {
                      categoriesViewModel
                          .processIntent(GetInitialCategoryIndex());
                      categoriesViewModel.processIntent(GetProductsIntent(
                          categoryId: categoriesViewModel.selectedCategoryId));
                      //tabs.addAll(viewModel.categoriesList.map((e) => e.name!));
                      return DefaultTabController(
                        length: categoriesViewModel.categoriesList.length,
                        initialIndex: categoriesViewModel.initialCategoryIndex,
                        child: TabBar(
                          onTap: (value) {
                            // if (value == 0) {
                            //   viewModel.processIntent(
                            //       TabBarChangedIntent(categoryId: null));
                            // }

                            categoriesViewModel.processIntent(
                                TabBarChangedIntent(
                                    categoryId: categoriesViewModel
                                        .categoriesList[value].id));
                          },
                          physics: const BouncingScrollPhysics(),
                          isScrollable: true,
                          indicatorPadding: EdgeInsets.zero,
                          indicatorWeight: 2,
                          tabs: categoriesViewModel.categoriesList
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
                  categoriesViewModel.productsList,
                );
              } else {
                return const LoadingWidget();
              }
            }),
          ),
          SortWidget(
            viewModel: categoriesViewModel,
          )
        ],
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

// ignore: must_be_immutable
