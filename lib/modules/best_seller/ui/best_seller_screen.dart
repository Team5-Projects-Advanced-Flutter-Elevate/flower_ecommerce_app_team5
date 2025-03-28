import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/product_card.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends BaseStatefulWidgetState<BestSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leadingWidth: screenWidth * 0.08,
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
          title: Column(
            crossAxisAlignment: Platform.isIOS
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.bestSeller.tr(),
                style: theme.textTheme.labelMedium,
              ),
              Text(
                LocaleKeys.bloomWithBestSeller.tr(),
                style: theme.textTheme.labelSmall!.copyWith(
                    color: AppColors.gray, fontSize: 13 * (screenWidth / 375)),
              ),
            ],
          ),
        ),
        body: GridView.builder(
          itemCount: 15,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 163 / 229,
              mainAxisSpacing: 17,
              crossAxisSpacing: 17),
          itemBuilder: (context, index) {
            return ProductCard(
                width: screenWidth * 0.45,
                height: screenHeight * 0.25,
                productTitle: "Forever Pink | Baby Roses",
                price: "2049",
                priceAfterDiscountIfExist: "1899",
                imageUrl:
                    "https://flower.elevateegy.com/uploads/336d4a68-109d-4f29-a35c-d5ca2215b4ff-cover_image.png");
          },
        ));
  }
}
