import 'package:flower_ecommerce_app_team5/core/widgets/cached_image.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import '../../../../../../../core/colors/app_colors.dart';
import '../../../../../../../core/constants/constants.dart';

// ignore: must_be_immutable
class BestSellerItem extends BaseStatelessWidget {
  BestSellerItem({
    super.key,
    required this.bestSellerEntity,
  });

  final ProductEntity bestSellerEntity;

  @override
  Widget customBuild(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.3,
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
          SizedBox(height: screenHeight * 0.01),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bestSellerEntity.title ?? '',
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: screenHeight * 0.003),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bestSellerEntity.priceAfterDiscount != null
                          ? "EGP ${bestSellerEntity.priceAfterDiscount?.toInt()}"
                          : "EGP ${bestSellerEntity.price?.toInt()}",
                      style: theme.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10 * (screenWidth / Constants.designWidth),
                      ),
                    ),
                    Text(
                      bestSellerEntity.priceAfterDiscount != null
                          ? "${bestSellerEntity.price!}"
                          : "",
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 8 * (screenWidth / Constants.designWidth),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      getPercentageOfDiscount(),
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 8 * (screenWidth / Constants.designWidth),
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
