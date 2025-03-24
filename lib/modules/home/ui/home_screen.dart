import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_error/api_error_handler.dart';
import 'package:flower_ecommerce_app_team5/core/constants/assets_paths.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedAppSectionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedAppSectionIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedAppSectionIndex = value;
            });
          },
          destinations: [
        NavigationDestination(
            icon: ImageIcon(AssetImage(AssetsPaths.homeIcon)),
            label: LocaleKeys.home.tr()),
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
    );
  }
}
