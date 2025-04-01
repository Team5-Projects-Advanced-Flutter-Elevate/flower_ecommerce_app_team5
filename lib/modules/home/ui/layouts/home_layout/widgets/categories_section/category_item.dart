import 'package:flutter/material.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import '../../../../../../../core/colors/app_colors.dart';

class CategoryItem extends BaseStatelessWidget {
  CategoryItem({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: screenHeight * 0.08,
          width: screenWidth * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.lightPink,
          ),
          child: Text(
            'data',
          ),
        ),
        SizedBox(
          height: screenHeight * 0.005,
        ),
        Text('data'),
      ],
    );
  }
}
