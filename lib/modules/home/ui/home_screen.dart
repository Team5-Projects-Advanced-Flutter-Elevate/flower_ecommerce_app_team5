import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/constants/assets_paths.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/cart_layout.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/categories_layout.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/home_layout.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/profile_layout.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  int selectedAppSectionIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  final homePages = [
    HomeLayout(),
    CategoriesLayout(),
    CartLayout(),
    ProfileLayout()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          selectedIndex: selectedAppSectionIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedAppSectionIndex = value;
              pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            });
          },
          destinations: [
            NavigationDestination(
                icon: ImageIcon(AssetImage(AssetsPaths.homeIcon)),
                label: tr(LocaleKeys.home)),
            NavigationDestination(
                icon: ImageIcon(AssetImage(AssetsPaths.categoriesIcon)),
                label: LocaleKeys.categories.tr()),
            NavigationDestination(
                icon: ImageIcon(AssetImage(AssetsPaths.cartIcon)),
                label: LocaleKeys.cart.tr()),
            NavigationDestination(
                icon: ImageIcon(AssetImage(AssetsPaths.profileIcon)),
                label: LocaleKeys.profile.tr()),
          ]),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            selectedAppSectionIndex = value;
          });
        },
        children: homePages,
      ),
    );
  }
}
