import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/bases/base_statless_widget.dart';
import 'category_item.dart';
// ignore: must_be_immutable
class CategoriesListView extends BaseStatelessWidget {
   CategoriesListView({
    super.key,
    required this.categories,
  });

  final List<CategoryEntity> categories;

  @override
  Widget customBuild(BuildContext context) {
    HomeScreenViewModel homeScreenViewModel = Provider.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => InkWell(
          hoverColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            homeScreenViewModel.selectedAppSectionIndex = 1;
            homeScreenViewModel.doIntent(AnimateToPage(pageIndex: 1));
            homeScreenViewModel.categoriesLayoutViewModel.selectedCategoryId =
                categories[index].id;
          },
          child: CategoryItem(
            categoryEntity: categories[index],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
      ),
    );
  }
}
