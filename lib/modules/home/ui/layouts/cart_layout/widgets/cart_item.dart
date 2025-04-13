import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/constants/assets_paths.dart';

class CartItem extends BaseStatelessWidget {
  CartItem({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Container(
      height: 125,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.025,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 0.5,
          color: AppColors.black,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(
            width: screenWidth * 0.03,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Red roses',
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontSize: 16 * (screenWidth / 375),
                            ),
                          ),
                          Text(
                            '15 pink rose Bouquet',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 12 * (screenWidth / 375),
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ImageIcon(
                        AssetImage(
                          AssetsPaths.deleteIcon,
                        ),
                        color: AppColors.red,
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'EGP 600',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 14 * (screenWidth / 375),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      ImageIcon(
                        AssetImage(
                          AssetsPaths.minusIcon,
                        ),
                        color: AppColors.black,
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      Text('1'),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      const Icon(Icons.add),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
