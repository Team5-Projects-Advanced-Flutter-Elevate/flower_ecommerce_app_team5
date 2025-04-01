import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';

import '../../../../../../../core/colors/app_colors.dart';

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
