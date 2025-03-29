import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProductCard extends BaseStatelessWidget {
  final String imageUrl;
  final String productTitle;
  final double? width, height;
  final num? price;
  final num? priceAfterDiscountIfExist;
  final void Function()? onAddToCartButtonClick, onProductCardClick;
  ProductCard(
      {super.key,
      required this.productTitle,
      required this.imageUrl,
      required this.price,
      this.onProductCardClick,
      this.priceAfterDiscountIfExist,
      this.onAddToCartButtonClick,
      this.width,
      this.height});

  @override
  Widget customBuild(BuildContext context) {
    return InkWell(
      onTap: onProductCardClick,
      splashColor: Colors.transparent,
      //hoverColor: Colors.transparent,
      //overlayColor: WidgetStateColor.transparent,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.white[70]!),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            children: [
              Expanded(
                flex: 13,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: width,
                  placeholder: (context, downloadProgress) =>
                      const LoadingWidget(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 12 * (screenWidth / 375)),
                      ),
                      SizedBox(
                        height: screenHeight * 0.001,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            priceAfterDiscountIfExist != null
                                ? "EGP ${priceAfterDiscountIfExist!}"
                                : "EGP $price",
                            style: theme.textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14 * (screenWidth / 375)),
                          ),
                          Text(
                            priceAfterDiscountIfExist != null ? "$price" : "",
                            style: theme.textTheme.labelSmall!.copyWith(
                                fontSize: 12 * (screenWidth / 375),
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(getPercentageOfDiscount(),
                              style: theme.textTheme.labelSmall!.copyWith(
                                fontSize: 12 * (screenWidth / 375),
                                fontWeight: FontWeight.w400,
                                color: AppColors.green,
                              ))
                        ],
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      Expanded(
                        flex: 15,
                        child: FilledButton(
                            onPressed: onAddToCartButtonClick,
                            style: FilledButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 18 * (screenWidth / 375),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.02,
                                ),
                                Text(
                                  LocaleKeys.addToCart.tr(),
                                  style: theme.textTheme.labelLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13 * (screenWidth / 375),
                                      color: AppColors.white),
                                )
                              ],
                            )),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  String getPercentageOfDiscount() {
    if (priceAfterDiscountIfExist != null) {
      if (price != null &&
          priceAfterDiscountIfExist != null &&
          price! > 0 &&
          priceAfterDiscountIfExist! > 0) {
        double percentage =
            ((price! - priceAfterDiscountIfExist!) / price!) * 100;
        return "${percentage.round()}%";
      }
    }
    return "";
  }
}
