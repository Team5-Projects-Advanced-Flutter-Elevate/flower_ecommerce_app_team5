import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/utilities/app_dialogs.dart';
import '../../../../../../core/widgets/loading_state_widget.dart';
import '../../../../../../core/widgets/product_card.dart';
import '../../../../../../shared_layers/localization/generated/locale_keys.g.dart';

class CategoryProductsView extends BaseStatelessWidget {
  final List<ProductEntity> productList;

  CategoryProductsView(this.productList, {super.key});

  @override
  Widget customBuild(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state.addToCartStatus == AddToCartStatus.noAccess) {
          displayAlertDialog(
            title: Text(
              LocaleKeys.pleaseLoginFirst.tr(),
            ),
            showOkButton: true,
            onOkButtonClick: () => Navigator.pushReplacementNamed(
              context,
              DefinedRoutes.loginScreenRoute,
            ),
            context: context,
          );
          return;
        }
        switch (state.addToCartStatus) {
          case AddToCartStatus.loading:
            displayAlertDialog(
              context: context,
              title: const LoadingWidget(),
            );
          case AddToCartStatus.success:
            hideAlertDialog(context);
            AppDialogs.showMessage(
              context,
              message: LocaleKeys.addedToCartSuccessfully.tr(),
              isSuccess: true,
            );
          case AddToCartStatus.error:
            hideAlertDialog(context);
            AppDialogs.showMessage(
              context,
              message: LocaleKeys.soldOut.tr(),
              isSuccess: false,
            );
          case AddToCartStatus.initial:
          case AddToCartStatus.noAccess:
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.01,
                ),
                child: productList.isEmpty
                    ? Center(
                        child: Text(
                          LocaleKeys.noProductsFound.tr(),
                          style: GoogleFonts.inter(
                              textStyle: theme.textTheme.bodyLarge!
                                  .copyWith(color: AppColors.white[70])),
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        itemCount: productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 163 / 229,
                          mainAxisSpacing: 17,
                          crossAxisSpacing: 17,
                        ),
                        itemBuilder: (context, index) => ProductCard(
                          id: productList[index].id,
                          onProductCardClick: () {},
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.25,
                          productTitle: productList[index].title!,
                          price: productList[index].price,
                          priceAfterDiscountIfExist:
                              productList[index].priceAfterDiscount,
                          imageUrl: productList[index].imgCover ?? '',
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}
