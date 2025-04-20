import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/widgets/invoice_section_and_checkout_button.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/widgets/title_cart_items.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/routing/defined_routes.dart';
import '../../../../../core/widgets/error_state_widget.dart';
import '../../../../../core/widgets/loading_state_widget.dart';

class CartLayout extends StatefulWidget {
  const CartLayout({super.key});

  @override
  State<CartLayout> createState() => _CartLayoutState();
}

class _CartLayoutState extends BaseStatefulWidgetState<CartLayout> {
  CartCubit cubit = getIt<CartCubit>();

  @override
  void initState() {
    super.initState();
    cubit.doIntent(GetCartItemsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.02,
        horizontal: screenWidth * 0.05,
      ),
      child: BlocConsumer<CartCubit, CartState>(
        listenWhen: (previous, current) =>
            current ==
            CartState(
              status: CartStatus.noAccess,
            ),
        listener: (context, state) {
          if (state.status == CartStatus.noAccess) {
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
          }
        },
        builder: (context, state) {
          switch (state.userLoginStatus) {
            case UserLoginStatus.loggedIn:
              break;
            case UserLoginStatus.guest:
              return Center(
                  child: Text(
                'Please Login First',
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
              ));
          }
          if (state.status == CartStatus.loading) {
            return const LoadingWidget();
          } else if (state.status == CartStatus.error) {
            return ErrorStateWidget(error: state.error!);
          } else if (state.status == CartStatus.success) {
            if (state.cartResponseEntity!.cartModelEntity!.cartItems!.isEmpty) {
              return Center(
                  child: Text(
                '${LocaleKeys.cartEmpty.tr()}\n ${LocaleKeys.addItemsToCart.tr()}',
                textAlign: TextAlign.center,
              ));
            }
            return Column(
              children: [
                TitleAndCartItems(
                  cartItems:
                      state.cartResponseEntity?.cartModelEntity?.cartItems ??
                          [],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                InvoiceSectionAndCheckoutButton(
                  cartResponseEntity: state.cartResponseEntity!,
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
