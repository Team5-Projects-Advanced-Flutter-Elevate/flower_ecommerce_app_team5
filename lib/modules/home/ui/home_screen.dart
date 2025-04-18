import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/constants/assets_paths.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/cart_layout.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/categories_layout.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/home_layout.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/profile_layout.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  late HomeScreenViewModel homeScreenViewModel;

  final homePages = [
    const HomeLayout(),
    const CategoriesLayout(),
    const CartLayout(),
    const ProfileLayout()
  ];

  @override
  Widget build(BuildContext context) {
    homeScreenViewModel = Provider.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
      ),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.white[60]!,
                  width: 1,
                ),
              ),
            ),
            child: NavigationBar(
                selectedIndex: homeScreenViewModel.selectedAppSectionIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    homeScreenViewModel.selectedAppSectionIndex = value;
                    homeScreenViewModel
                        .doIntent(JumpToPage(pageIndex: value));
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
          ),
          body: PageView(
            controller: homeScreenViewModel.pageController,
            onPageChanged: (value) {
              setState(() {
                homeScreenViewModel.selectedAppSectionIndex = value;
              });
            },
            children: homePages,
          ),
        ),
      ),
    );
  }
}
