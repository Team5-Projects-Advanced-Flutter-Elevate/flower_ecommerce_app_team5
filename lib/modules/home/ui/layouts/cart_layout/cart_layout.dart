import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/widgets/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/bases/base_statless_widget.dart';
import '../../../../../core/constants/assets_paths.dart';

class CartLayout extends StatefulWidget {
  const CartLayout({super.key});

  @override
  State<CartLayout> createState() => _CartLayoutState();
}

class _CartLayoutState extends BaseStatefulWidgetState<CartLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.02,
        horizontal: screenWidth * 0.05,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Cart ',
                      style: theme.textTheme.labelMedium,
                    ),
                    Text(
                      '(3 items)',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: AppColors.gray,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Expanded(
                  child: CartListView(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      InvoiceSection(),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(
                      'Checkout',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 16 * (screenWidth / 375),
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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

class CartListView extends BaseStatelessWidget {
  CartListView({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CartItem(),
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(
        height: screenHeight * 0.025,
      ),
    );
  }
}
