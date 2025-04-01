import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/best_seller_section/best_seller_section.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/categories_section/categoreis_section.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/occasions_section/occasions_section.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/search_bar_and_logo.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends BaseStatefulWidgetState<HomeLayout> {
  late TextEditingController searchController;
  late FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
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
          top: screenHeight * 0.04,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              SizedBox(
                height: screenHeight * 0.015,
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
