import 'package:auto_size_text/auto_size_text.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/constants/assets_paths.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/di/injectable_initializer.dart';
import '../../../../../../core/widgets/cached_image.dart';
import '../../../../domain/entities/cart_response_entity/cart_item_entity.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends BaseStatefulWidgetState<CartItem> {
  CartCubit cartCubit = getIt.get<CartCubit>();
  final counter = ValueNotifier<int>(1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.16,
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
              child: CachedImage(
                url: widget.cartItemEntity.productEntity?.imgCover ?? '',
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
                              widget.cartItemEntity.productEntity?.title ?? '',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontSize: 16 * (screenWidth / 375),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: screenHeight * 0.002,
                            ),
                            Text(
                              widget.cartItemEntity.productEntity
                                      ?.description ??
                                  '',
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
                      InkWell(
                        onTap: () {
                          cartCubit.doIntent(DeleteFromCartIntent(
                            id: widget.cartItemEntity.productEntity!.id!,
                          ));
                        },
                        child: ImageIcon(
                          AssetImage(
                            AssetsPaths.deleteIcon,
                          ),
                          color: AppColors.red,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.cartItemEntity.productEntity
                                          ?.priceAfterDiscount !=
                                      null
                                  ? "EGP ${widget.cartItemEntity.productEntity?.priceAfterDiscount?.toInt()}"
                                  : "EGP ${widget.cartItemEntity.price?.toInt()}",
                              style: theme.textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    12 * (screenWidth / Constants.designWidth),
                              ),
                            ),
                            Text(
                              widget.cartItemEntity.productEntity
                                          ?.priceAfterDiscount !=
                                      null
                                  ? "${widget.cartItemEntity.price!}"
                                  : "",
                              style: theme.textTheme.labelSmall!.copyWith(
                                  fontSize:
                                      8 * (screenWidth / Constants.designWidth),
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(getPercentageOfDiscount(),
                                style: theme.textTheme.labelSmall!.copyWith(
                                  fontSize:
                                      8 * (screenWidth / Constants.designWidth),
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.green,
                                ))
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: screenWidth * 0.02,
                      // ),
                      const Spacer(),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (counter.value <= 1) return;
                                counter.value--;
                                cartCubit.doIntent(DecrementIntent(
                                  price: widget.cartItemEntity.productEntity
                                          ?.priceAfterDiscount
                                          ?.toInt() ??
                                      0,
                                ));
                              },
                              child: ImageIcon(
                                AssetImage(
                                  AssetsPaths.minusIcon,
                                ),
                                color: AppColors.black,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            ValueListenableBuilder(
                              valueListenable: counter,
                              builder: (context, value, child) => Text(
                                '$value',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12 * (screenWidth / 375),
                                ),
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            InkWell(
                              onTap: () {
                                counter.value++;
                                cartCubit.doIntent(IncrementIntent(
                                  price: widget.cartItemEntity.productEntity
                                          ?.priceAfterDiscount
                                          ?.toInt() ??
                                      0,
                                ));
                              },
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
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

  String getPercentageOfDiscount() {
    if (widget.cartItemEntity.productEntity?.priceAfterDiscount != null) {
      if (widget.cartItemEntity.price != null &&
          widget.cartItemEntity.productEntity?.priceAfterDiscount != null &&
          widget.cartItemEntity.price! > 0 &&
          widget.cartItemEntity.productEntity!.priceAfterDiscount! > 0) {
        double percentage = ((widget.cartItemEntity.price! -
                    widget.cartItemEntity.productEntity!.priceAfterDiscount!) /
                widget.cartItemEntity.price!) *
            100;
        return "${percentage.round()}%";
      }
    }
    return "";
  }
}
