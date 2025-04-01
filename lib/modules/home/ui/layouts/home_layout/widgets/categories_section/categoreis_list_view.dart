import 'package:flutter/material.dart';
import '../../../../../../../core/bases/base_statless_widget.dart';
import 'category_item.dart';

class CategoriesListView extends BaseStatelessWidget {
  CategoriesListView({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Container(
      height: screenHeight * 0.11,
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => CategoryItem(),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
      ),
    );
  }
}
