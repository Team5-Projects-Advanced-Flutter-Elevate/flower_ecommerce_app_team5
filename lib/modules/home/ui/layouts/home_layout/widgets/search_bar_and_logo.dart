import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/constants/assets_paths.dart';

class SearchBarAndLogo extends StatelessWidget {
  const SearchBarAndLogo({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.searchController,
    required this.searchFocusNode,
  });

  final double screenHeight;
  final double screenWidth;
  final TextEditingController searchController;
  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                hintText: LocaleKeys.search.tr(),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.white[70],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
