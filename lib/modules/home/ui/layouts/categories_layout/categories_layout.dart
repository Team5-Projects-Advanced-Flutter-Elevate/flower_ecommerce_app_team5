import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/product_card.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';

class CategoriesLayout extends StatefulWidget {
  const CategoriesLayout({super.key});

  @override
  State<CategoriesLayout> createState() => _CategoriesLayoutState();
}

class _CategoriesLayoutState extends BaseStatefulWidgetState<CategoriesLayout> {
  final List<String> tabs = [
    'All',
    'Hand Bouquet',
    'Boxed Flowers',
    'Flower Arrangements',
    'Wedding',
    'Funeral',
    'Plants',
    'Gifts',
    'Chocolate',
    'Vases',
    'Special Offers',
    'Seasonal',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            toolbarHeight: screenHeight * 0.1,
            title: _buildSearchAndFilterRow(),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight - 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  //automaticIndicatorColorAdjustment: false,
                  physics: const BouncingScrollPhysics(),
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicatorColor: AppColors.mainColor,

                  labelColor: AppColors.mainColor,

                  unselectedLabelColor:
                      AppColors.white[70], // Use your grey color
                  labelStyle: theme.textTheme.bodyLarge,
                  unselectedLabelStyle:
                      GoogleFonts.inter(textStyle: theme.textTheme.bodyLarge),
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                  indicatorWeight: 2,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: tabs.map((title) => Text(title)).toList(),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              //SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.01,
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    itemCount: 15,
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
                      productTitle: "Forever Pink | Baby Roses",
                      price: 2049,
                      priceAfterDiscountIfExist: 1899,
                      imageUrl:
                          "https://flower.elevateegy.com/uploads/336d4a68-109d-4f29-a35c-d5ca2215b4ff-cover_image.png",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
              border: _outlineInputBorder(AppColors.white[70]!),
              enabledBorder: _outlineInputBorder(AppColors.white[70]!),
              focusedBorder: _outlineInputBorder(AppColors.mainColor),
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

  OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }

  Widget _buildTab(String title) {
    return Tab(
      icon: Text(
        title,
        style: GoogleFonts.inter(
          textStyle: theme.textTheme.bodyLarge!.copyWith(
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}
