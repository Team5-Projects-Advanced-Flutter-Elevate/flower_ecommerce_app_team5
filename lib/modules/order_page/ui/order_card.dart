import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flutter/material.dart';
import '../../../core/bases/base_stateful_widget_state.dart';
import '../../../core/entities/order/order_entity.dart';
import '../../../shared_layers/localization/generated/locale_keys.g.dart';

class OrderCard extends StatefulWidget {
  final OrderEntity orderEntity;

  const OrderCard({super.key, required this.orderEntity});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends BaseStatefulWidgetState<OrderCard> {
  @override
  Widget build(BuildContext context) {
    debugPrint("======> price ${widget.orderEntity.totalPrice}");

    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.gray),
      ),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Image
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                child: Row(
                  children: List.generate(
                    widget.orderEntity.orderItems?.length ?? 0,
                    (index) {
                      return SizedBox(
                        width: (screenWidth / 2) - 36,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: widget.orderEntity.orderItems?[index]
                                        .product?.imgCover ??
                                    "",
                                width: (screenWidth / 2) - 36,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Text info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(getOrderTitle(), style: const TextStyle(fontSize: 16)),
                  SizedBox(height: screenHeight * 0.002),
                  Text('EGP ${widget.orderEntity.totalPrice ?? 0}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: screenHeight * 0.002),
                  Text('Order number# ${widget.orderEntity.orderNumber ?? ""}',
                      style: const TextStyle(color: Colors.grey)),
                  SizedBox(height: screenHeight * 0.005),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint("====== order id ${widget.orderEntity.id}");
                      Navigator.pushNamed(
                          context, DefinedRoutes.trackOrderDetailsScreenRoute,
                          arguments: widget.orderEntity.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(LocaleKeys.trackOrder.tr()),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Button
          ],
        ),
      ),
    );
  }

  String getOrderTitle() {
    String orderTitle = "";
    if (widget.orderEntity.orderItems != null) {
      var orderItems = widget.orderEntity.orderItems!;
      for (int i = 0; i < orderItems.length; i++) {
        if (orderItems[i].product?.title == null) continue;
        orderTitle += orderItems[i].product!.title!;
        if (i != orderItems.length - 1) orderTitle += ' | ';
      }
    }
    return orderTitle;
  }
}
