import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../core/colors/app_colors.dart';
// ignore: must_be_immutable
class CategoryItem extends BaseStatelessWidget {
   const CategoryItem({
    super.key,
    required this.categoryEntity,
  });

  final CategoryEntity categoryEntity;

  @override
  Widget customBuild(BuildContext context,  inherit) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: inherit.screenHeight * 0.08,
          width: inherit.screenWidth * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.lightPink,
          ),
          child: SizedBox(
            width: inherit.screenWidth * 0.1 / 1.5,
            height: inherit.screenHeight * 0.1 / 1.5,
            child: CachedImage(
              url: categoryEntity.image ?? '',
            ),
          ),
        ),
        SizedBox(
          height: inherit.screenHeight * 0.005,
        ),
        Text(
          categoryEntity.name ?? '',
          style: GoogleFonts.inter(
            textStyle: inherit.theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
