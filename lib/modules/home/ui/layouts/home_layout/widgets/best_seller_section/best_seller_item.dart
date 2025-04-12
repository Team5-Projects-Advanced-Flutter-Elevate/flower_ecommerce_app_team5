import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/best_seller_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import '../../../../../../../core/colors/app_colors.dart';

class BestSellerItem extends BaseStatelessWidget {
  BestSellerItem({
    super.key,
    required this.bestSellerEntity,
  });

  final BestSellerEntity bestSellerEntity;

  @override
  Widget customBuild(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: CashedImage(
              fit: BoxFit.cover,
              url: bestSellerEntity.imgCover ?? '',
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Expanded(
            flex: 1,
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
                SizedBox(
                  height: screenHeight * 0.003,
                ),
                Text(
                  '${bestSellerEntity.price} EGP' ?? '',
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
