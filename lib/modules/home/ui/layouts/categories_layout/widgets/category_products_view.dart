import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/widgets/product_card.dart';
import '../../../../../../shared_layers/localization/generated/locale_keys.g.dart';

class CategoryProductsView extends BaseStatelessWidget {
  final List<ProductEntity> productList;

  const CategoryProductsView(this.productList, {super.key});

  @override
  Widget customBuild(BuildContext context, inherit) {
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
          );
          return;
        }
        if (state.addToCartStatus == AddToCartStatus.success) {
          // AppDialogs.showMessage(
          //   context,
          //   message: LocaleKeys.addedToCartSuccessfully.tr(),
          //   isSuccess: true,
          // );
          displayAlertDialog(
            title: Text(
              LocaleKeys.addedToCartSuccessfully.tr(),
            ),
            isDismissible: true,
            showOkButton: true,
            autoDismissible: true,
          );
        } else if (state.addToCartStatus == AddToCartStatus.error) {
          // AppDialogs.showMessage(
          //   context,
          //   message: LocaleKeys.soldOut.tr(),
          //   isSuccess: false,
          // );
          displayAlertDialog(
            title: Text(
              LocaleKeys.soldOut.tr(),
            ),
            isDismissible: true,
            showOkButton: true,
            autoDismissible: true,
          );
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: inherit.screenWidth * 0.04,
                vertical: inherit.screenHeight * 0.01,
              ),
              child: productList.isEmpty
                  ? Center(
                      child: Text(
                        LocaleKeys.noProductsFound.tr(),
                        style: GoogleFonts.inter(
                            textStyle: inherit.theme.textTheme.bodyLarge!
                                .copyWith(color: AppColors.white[70])),
                      ),
                    )
                  : GridView.builder(
                      padding:
                          EdgeInsets.only(top: inherit.screenHeight * 0.02),
                      itemCount: productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 163 / 229,
                        mainAxisSpacing: 17,
                        crossAxisSpacing: 17,
                      ),
                      itemBuilder: (context, index) =>
                          BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          var isLoading = state.addToCartStatus ==
                                  AddToCartStatus.loading &&
                              state.addingProductId == productList[index].id;
                          var disabled =
                              state.addToCartStatus == AddToCartStatus.loading;
                          return ProductCard(
                            id: productList[index].id,
                            isLoading: isLoading,
                            disabled: disabled,
                            onProductCardClick: () {
                              Navigator.pushNamed(
                                context,
                                DefinedRoutes.productDetailsScreenRoute,
                                arguments: productList[index],
                              );
                            },
                            width: inherit.screenWidth * 0.45,
                            height: inherit.screenHeight * 0.25,
                            productTitle: productList[index].title!,
                            price: productList[index].price,
                            priceAfterDiscountIfExist:
                                productList[index].priceAfterDiscount,
                            imageUrl: productList[index].imgCover ?? '',
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
