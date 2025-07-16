import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/constants/constants.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/cached_image.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import '../../modules/home/data/models/cart_response/add_to_cart_request.dart';

// ignore: must_be_immutable
class ProductCard extends BaseStatelessWidget {
  final String imageUrl;
  final String productTitle;
  final String? id;
  final double? width, height;
  final num? price;
  final num? priceAfterDiscountIfExist;
  final void Function()? onProductCardClick;
  final bool isLoading;
  final bool disabled;

  const ProductCard({
    super.key,
    required this.productTitle,
    required this.imageUrl,
    required this.price,
    this.onProductCardClick,
    this.priceAfterDiscountIfExist,
    this.width,
    this.height,
    this.id,
    this.isLoading = false,
    this.disabled = false,
  });

  @override
  Widget customBuild(BuildContext context, inherit) {
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
          padding: EdgeInsets.all(inherit.screenWidth * 0.02),
          child: Column(
            children: [
              Expanded(
                  flex: 13,
                  child: CachedImage(
                    url: imageUrl,
                    fit: BoxFit.cover,
                    width: width,
                  )),
              Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: inherit.theme.textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 12 *
                                (inherit.screenWidth / Constants.designWidth)),
                      ),
                      SizedBox(
                        height: inherit.screenHeight * 0.001,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            priceAfterDiscountIfExist != null
                                ? "EGP ${priceAfterDiscountIfExist!}"
                                : "EGP $price",
                            style: inherit.theme.textTheme.labelMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14 *
                                        (inherit.screenWidth /
                                            Constants.designWidth)),
                          ),
                          Text(
                            priceAfterDiscountIfExist != null ? "$price" : "",
                            style: inherit.theme.textTheme.labelSmall!.copyWith(
                                fontSize: 12 *
                                    (inherit.screenWidth /
                                        Constants.designWidth),
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(getPercentageOfDiscount(),
                              style:
                                  inherit.theme.textTheme.labelSmall!.copyWith(
                                fontSize: 12 *
                                    (inherit.screenWidth /
                                        Constants.designWidth),
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
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                              onPressed: disabled
                                  ? null
                                  : () {
                                      getIt<CartCubit>().doIntent(
                                        AddToCartIntent(
                                          request: AddToCartRequest(
                                            product: id,
                                            quantity: 1,
                                          ),
                                        ),
                                      );
                                    },
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                              ),
                              child: isLoading
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.shopping_cart_outlined,
                                          size: 18 *
                                              (inherit.screenWidth /
                                                  Constants.designWidth),
                                        ),
                                        SizedBox(
                                          width: inherit.screenWidth * 0.02,
                                        ),
                                        Text(
                                          LocaleKeys.addToCart.tr(),
                                          style: inherit
                                              .theme.textTheme.labelLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13 *
                                                      (inherit.screenWidth /
                                                          Constants
                                                              .designWidth),
                                                  color: AppColors.white),
                                        )
                                      ],
                                    )),
                        ),
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
