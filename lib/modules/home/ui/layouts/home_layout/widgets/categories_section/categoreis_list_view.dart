import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/bases/base_statless_widget.dart';
import 'category_item.dart';

class CategoriesListView extends BaseStatelessWidget {
  CategoriesListView({
    super.key,
    required this.categories,
  });

  final List<CategoryEntity> categories;

  @override
  Widget customBuild(BuildContext context) {
    return Container(
      height: screenHeight * 0.11,
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryItem(
          categoryEntity: categories[index],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
      ),
    );
  }
}
