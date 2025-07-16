import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/enums/languages_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/bases/base_statless_widget.dart';
import 'category_item.dart';

// ignore: must_be_immutable
class CategoriesListView extends BaseStatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
  });

  final List<CategoryEntity> categories;

  @override
  Widget customBuild(BuildContext context, inherit) {
    HomeScreenViewModel homeScreenViewModel = Provider.of(context);
    bool isCurrentLocaleEnglish = inherit.localizationManager.currentLocale ==
        LanguagesEnum.en.getLanguageCode();
    return Padding(
      padding: EdgeInsets.only(
        left: isCurrentLocaleEnglish ? inherit.screenWidth * 0.05 : inherit.screenWidth * 0.03,
        right: isCurrentLocaleEnglish ? inherit.screenWidth * 0.03 : inherit.screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => InkWell(
          hoverColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            homeScreenViewModel.setAppSectionsIndex(1);
            homeScreenViewModel.doIntent(JumpToPage(pageIndex: 1));
            homeScreenViewModel.categoriesLayoutViewModel.selectedCategoryId =
                categories[index].id;
          },
          child: CategoryItem(
            categoryEntity: categories[index],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: inherit.screenWidth * 0.04,
        ),
      ),
    );
  }
}
