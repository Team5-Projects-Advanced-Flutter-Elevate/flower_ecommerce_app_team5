import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/cashed_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/constants/assets_paths.dart';
import '../../../../domain/entities/cart_response_entity/cart_item_entity.dart';

class CartItem extends BaseStatelessWidget {
  CartItem({super.key, required this.cartItemEntity});

  CartItemEntity cartItemEntity;

  @override
  Widget customBuild(BuildContext context) {
    return Container(
      height: screenHeight * 0.14,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.011,
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
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: CashedImage(
                url: cartItemEntity.productEntity?.imgCover ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.03,
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItemEntity.productEntity?.title ?? '',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontSize: 16 * (screenWidth / 375),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.002,
                            ),
                            Text(
                              cartItemEntity.productEntity?.description ?? '',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 12 * (screenWidth / 375),
                                color: AppColors.gray,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
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
                        'EGP ${cartItemEntity.price?.toInt()}',
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
