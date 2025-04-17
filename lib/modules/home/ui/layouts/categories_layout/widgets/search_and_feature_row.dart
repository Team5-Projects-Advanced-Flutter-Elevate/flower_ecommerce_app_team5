import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../shared_layers/localization/generated/locale_keys.g.dart';
// ignore: must_be_immutable
class SearchAndFilterRow extends BaseStatelessWidget {
   SearchAndFilterRow({super.key});
  @override
  Widget customBuild(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: LocaleKeys.search,
              hintStyle: GoogleFonts.inter(
                textStyle: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 14 * (screenWidth / Constants.designWidth),
                  color: AppColors.white[70],
                ),
              ),
              prefixIcon: Icon(Icons.search, color: AppColors.white[70]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.white[70]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.white[70]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.mainColor),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20 * (screenWidth / Constants.designWidth),
            vertical: 13 * (screenWidth / Constants.designWidth),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white[70]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.sort_sharp, color: AppColors.white[70]),
        ),
      ],
    );
  }
}
