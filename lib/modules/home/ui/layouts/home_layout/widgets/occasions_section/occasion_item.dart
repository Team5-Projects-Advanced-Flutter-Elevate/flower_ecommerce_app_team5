import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../../core/colors/app_colors.dart';
import '../cashed_image.dart';

class OccasionItem extends BaseStatelessWidget {
  OccasionItem({
    super.key,
    required this.occasionEntity,
  });

  final OccasionEntity occasionEntity;

  @override
  Widget customBuild(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.18,
            child: CashedImage(
              fit: BoxFit.cover,
              url: occasionEntity.image ?? '',
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Text(
            occasionEntity.name ?? '',
            style: GoogleFonts.inter(
              textStyle: theme.textTheme.bodySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
