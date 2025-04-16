import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/bases/base_statless_widget.dart';
import 'best_seller_item.dart';

class BestSellerListView extends BaseStatelessWidget {
  BestSellerListView({super.key, required this.bestSellers});

  final List<ProductEntity> bestSellers;

  @override
  Widget customBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(
                context, DefinedRoutes.productDetailsScreenRoute,
                arguments: bestSellers[index]);
          },
          child: BestSellerItem(
            bestSellerEntity: bestSellers[index],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
        itemCount: bestSellers.length,
      ),
    );
  }
}
