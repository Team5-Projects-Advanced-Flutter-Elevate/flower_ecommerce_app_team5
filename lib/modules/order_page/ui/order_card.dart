import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flutter/material.dart';

import '../../../core/bases/base_stateful_widget_state.dart';
import '../../../shared_layers/localization/generated/locale_keys.g.dart';

class OrderCard extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final num? price;
  final String? orderNumber;
  const OrderCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.orderNumber});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends BaseStatefulWidgetState<OrderCard> {
  @override
  Widget build(BuildContext context) {
    print("======> price ${widget.price}");

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
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl ?? "",
                scale: 5.0,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 16),
            // Text info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(widget.title ?? "",
                      style: const TextStyle(fontSize: 16)),
                  SizedBox(height: screenHeight * 0.002),
                  Text('EGP ${widget.price ?? 0}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: screenHeight * 0.002),
                  Text('Order number# ${widget.orderNumber ?? ""}',
                      style: const TextStyle(color: Colors.grey)),
                  SizedBox(height: screenHeight * 0.005),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, DefinedRoutes.trackOrderDetailsScreenRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: AppColors.white,
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
}
