import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';

class InvoiceSection extends BaseStatelessWidget {
  InvoiceSection({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'sub total ',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16 * (screenWidth / 375),
                  color: AppColors.gray,
                ),
              ),
            ),
            const Spacer(),
            Text(
              'EGP 600',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16 * (screenWidth / 375),
                  color: AppColors.gray,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Row(
          children: [
            Text(
              'Delivery fee ',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16 * (screenWidth / 375),
                  color: AppColors.gray,
                ),
              ),
            ),
            const Spacer(),
            Text(
              'EGP 600',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16 * (screenWidth / 375),
                  color: AppColors.gray,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Divider(
          color: AppColors.gray,
        ),
        Row(
          children: [
            Text(
              'Total',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18 * (screenWidth / 375),
                ),
              ),
            ),
            const Spacer(),
            Text(
              'EGP 600',
              style: GoogleFonts.roboto(
                textStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18 * (screenWidth / 375),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
