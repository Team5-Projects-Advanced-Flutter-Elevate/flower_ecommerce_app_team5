
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/view_model/home_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/best_seller_section/best_seller_section.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/categories_section/categoreis_section.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/occasions_section/occasions_section.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/search_bar_and_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends BaseStatefulWidgetState<HomeLayout> {
  late TextEditingController searchController;
  late FocusNode searchFocusNode;
  var cubit = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.doIntent(GetHomeDataIntent());
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.03,
        ),
        child: BlocProvider(
          create: (context) => cubit,
          child: Column(
            children: [
              SearchBarAndLogo(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                searchController: searchController,
                searchFocusNode: searchFocusNode,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              CategoriesSection(
                screenHeight: screenHeight,
              ),
              BestSellerSection(
                screenHeight: screenHeight,
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              OccasionsSection(
                screenHeight: screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
