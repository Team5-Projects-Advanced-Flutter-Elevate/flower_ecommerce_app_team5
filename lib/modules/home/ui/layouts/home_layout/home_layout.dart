import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/bases/base_statless_widget.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';

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
              //// search bar and logo
              Container(
                height: screenHeight * 0.045,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        AssetsPaths.logo,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: searchController,
                        focusNode: searchFocusNode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.white[70]!,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.white[70]!,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.mainColor,
                            ),
                          ),
                          hintText: 'search',
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.white[70],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: screenHeight * 0.03,
              ),

              //// categories
              SizedBox(
                height: screenHeight * 0.16,
                child: Column(
                  children: [
                    HeadLineSection(
                      'Categories',
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    CategoriesListView(),
                  ],
                ),
              ),

              //// space
              SizedBox(
                height: screenHeight * 0.015,
              ),

              //// Best seller
              SizedBox(
                height: screenHeight * 0.29,
                child: Column(
                  children: [
                    HeadLineSection(
                      'Best Seller',
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    BestSellerListView(),
                  ],
                ),
              ),

              //// space
              SizedBox(
                height: screenHeight * 0.01,
              ),

              //// occasions
              SizedBox(
                height: screenHeight * 0.27,
                child: Column(
                  children: [
                    HeadLineSection(
                      'Occasions',
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    OccasionsListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OccasionItem extends BaseStatelessWidget {
  OccasionItem({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.lightPink,
          height: screenHeight * 0.18,
          width: screenWidth * 0.3,
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Text(
          'wedding',
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.bodySmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class OccasionsListView extends BaseStatelessWidget {
  OccasionsListView({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Container(
      height: screenHeight * 0.22,
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => OccasionItem(),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
        itemCount: 10,
      ),
    );
  }
}

class BestSellerListView extends BaseStatelessWidget {
  BestSellerListView({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Container(
      height: screenHeight * 0.23,
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => BestSellerItem(),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
        itemCount: 10,
      ),
    );
  }
}

class BestSellerItem extends BaseStatelessWidget {
  BestSellerItem({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.lightPink,
          height: screenHeight * 0.18,
          width: screenWidth * 0.3,
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Text(
          'Sunny',
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.bodySmall?.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        Text(
          '600 EGP',
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.bodySmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class HeadLineSection extends BaseStatelessWidget {
  HeadLineSection(this.title, {super.key});

  final String title;

  @override
  Widget customBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              textStyle: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Text(
            'View All',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.mainColor,
              textStyle: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColors.mainColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryItem extends BaseStatelessWidget {
  CategoryItem({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: screenHeight * 0.08,
          width: screenWidth * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.lightPink,
          ),
          child: Text(
            'data',
          ),
        ),
        SizedBox(
          height: screenHeight * 0.005,
        ),
        Text('data'),
      ],
    );
  }
}

class CategoriesListView extends BaseStatelessWidget {
  CategoriesListView({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Container(
      height: screenHeight * 0.11,
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => CategoryItem(),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
      ),
    );
  }
}
