import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import '../../../../../../../core/colors/app_colors.dart';
import '../../../../../../../core/constants/constants.dart';

class BestSellerItem extends BaseStatelessWidget {
  const BestSellerItem({
    super.key,
    required this.bestSellerEntity,
  });

  final ProductEntity bestSellerEntity;

  @override
  Widget customBuild(BuildContext context,  inherit) {
    return SizedBox(
      width: inherit.screenWidth * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: CachedImage(
              fit: BoxFit.cover,
              url: bestSellerEntity.imgCover ?? '',
            ),
          ),
          SizedBox(height: inherit.screenHeight * 0.01),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bestSellerEntity.title ?? '',
                  style: GoogleFonts.inter(
                    textStyle: inherit.theme.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: inherit.screenHeight * 0.003),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bestSellerEntity.priceAfterDiscount != null
                          ? "EGP ${bestSellerEntity.priceAfterDiscount?.toInt()}"
                          : "EGP ${bestSellerEntity.price?.toInt()}",
                      style: inherit.theme.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10 * (inherit.screenWidth / Constants.designWidth),
                      ),
                    ),
                    Text(
                      bestSellerEntity.priceAfterDiscount != null
                          ? "${bestSellerEntity.price!}"
                          : "",
                      style: inherit.theme.textTheme.labelSmall!.copyWith(
                        fontSize: 8 * (inherit.screenWidth / Constants.designWidth),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      getPercentageOfDiscount(),
                      style: inherit.theme.textTheme.labelSmall!.copyWith(
                        fontSize: 8 * (inherit.screenWidth / Constants.designWidth),
                        fontWeight: FontWeight.w400,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getPercentageOfDiscount() {
    if (bestSellerEntity.priceAfterDiscount != null) {
      if (bestSellerEntity.price != null &&
          bestSellerEntity.priceAfterDiscount != null &&
          bestSellerEntity.price! > 0 &&
          bestSellerEntity.priceAfterDiscount! > 0) {
        double percentage =
            ((bestSellerEntity.price! - bestSellerEntity.priceAfterDiscount!) /
                    bestSellerEntity.price!) *
                100;
        return "${percentage.round()}%";
      }
    }
    return "";
  }
}
