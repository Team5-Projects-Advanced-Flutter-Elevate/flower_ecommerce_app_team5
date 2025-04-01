import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../../core/colors/app_colors.dart';

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
