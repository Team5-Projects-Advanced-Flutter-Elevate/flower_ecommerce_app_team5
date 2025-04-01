import 'package:flutter/material.dart';
import '../../../../../../../core/bases/base_statless_widget.dart';
import 'best_seller_item.dart';

class BestSellerListView extends BaseStatelessWidget {
  BestSellerListView({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Container(
      height: screenHeight * 0.23,
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => BestSellerItem(),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
        itemCount: 10,
      ),
    );
  }
}
