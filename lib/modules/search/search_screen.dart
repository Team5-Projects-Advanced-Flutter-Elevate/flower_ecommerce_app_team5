import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/modules/search/view_model/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/apis/api_error/api_error_handler.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/constants.dart';
import '../../core/di/injectable_initializer.dart';
import '../../core/routing/defined_routes.dart';
import '../../core/utilities/app_dialogs.dart';
import '../../core/widgets/loading_state_widget.dart';
import '../../core/widgets/product_card.dart';
import '../../shared_layers/localization/generated/locale_keys.g.dart';
import '../home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import '../home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseStatefulWidgetState<SearchScreen> {
  final SearchCubit viewModel = getIt.get<SearchCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.08,
        automaticallyImplyLeading: false,
        title: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            viewModel.search(searchKey: value);
          },
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.white[70]!,
              ),
            ),
            hintText: LocaleKeys.search,
            hintStyle: GoogleFonts.inter(
              textStyle: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 14 * (screenWidth / Constants.designWidth),
                color: AppColors.white[70],
              ),
            ),
            suffixIcon: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel_outlined, color: AppColors.white[70])),
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
      body: BlocListener<CartCubit, CartState>(
        listenWhen: (previous, current) =>
            current.addToCartStatus != previous.addToCartStatus,
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
          switch (state.addToCartStatus) {
            case AddToCartStatus.loading:
              Future.delayed(Duration.zero, () {
                displayAlertDialog(
                  title: const LoadingWidget(),
                );
              });

            case AddToCartStatus.success:
              hideAlertDialog();
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

            case AddToCartStatus.error:
              hideAlertDialog();
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

            case AddToCartStatus.initial:
            case AddToCartStatus.noAccess:
          }
        },
        child: BlocBuilder<SearchCubit, SearchState>(
          bloc: viewModel,
          builder: (context, state) {
            switch (state) {
              case SearchInitial():
                return Center(
                  child: Text(
                    LocaleKeys.searchForAnyProductYouWant.tr(),
                    style: GoogleFonts.inter(
                      textStyle: theme.textTheme.titleSmall!.copyWith(
                          fontSize: 16 * (screenWidth / Constants.designWidth),
                          color: AppColors.mainColor),
                    ),
                  ),
                );
              case SearchLoading():
                return const LoadingWidget();
              case SearchSuccess():
                var productsList = state.productsList;
                if (productsList.isEmpty) {
                  return Center(
                    child: Text(
                      LocaleKeys.noProductsFound.tr(),
                      style: GoogleFonts.inter(
                        textStyle: theme.textTheme.titleSmall!.copyWith(
                            fontSize:
                                16 * (screenWidth / Constants.designWidth),
                            color: AppColors.mainColor),
                      ),
                    ),
                  );
                }
                return Material(
                  color: AppColors.white,
                  child: GridView.builder(
                    itemCount: productsList.length,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.01),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 163 / 229,
                            mainAxisSpacing: 17,
                            crossAxisSpacing: 17),
                    itemBuilder: (context, index) {
                      return ProductCard(
                          onProductCardClick: () {
                            Navigator.pushNamed(context,
                                DefinedRoutes.productDetailsScreenRoute,
                                arguments: productsList[index]);
                          },
                          id: productsList[index].id,
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.25,
                          productTitle: productsList[index].title ?? "",
                          price: productsList[index].price ?? 0,
                          priceAfterDiscountIfExist:
                              productsList[index].priceAfterDiscount,
                          imageUrl: productsList[index].imgCover ?? "");
                    },
                  ),
                );
              case SearchError():
                return CustomScrollView(slivers: [
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        ApiErrorHandler.getInstance().handle(state.error),
                        style: GoogleFonts.inter(
                          textStyle: theme.textTheme.titleSmall!.copyWith(
                              fontSize:
                                  16 * (screenWidth / Constants.designWidth),
                              color: AppColors.mainColor),
                        ),
                      ),
                    ),
                  ),
                ]);
            }
          },
        ),
      ),
    );
  }
}
/*
Center(
        child: Text(
          'Search For Any Product You Want',
          style: GoogleFonts.inter(
            textStyle: inherit.theme.textTheme.titleSmall!.copyWith(
                fontSize: 16 * (inherit.screenWidth / Constants.designWidth),
                color: AppColors.mainColor),
          ),
        ),
      )
* */
