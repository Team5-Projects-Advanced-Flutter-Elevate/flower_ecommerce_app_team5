import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';

class HeadLineSection extends BaseStatelessWidget {
  HeadLineSection(this.title, {super.key, this.onTap,});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget customBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              textStyle: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              LocaleKeys.viewAll.tr(),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.mainColor,
                textStyle: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
