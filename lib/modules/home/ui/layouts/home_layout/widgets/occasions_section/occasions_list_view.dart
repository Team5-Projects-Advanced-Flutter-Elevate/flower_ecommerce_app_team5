import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/enums/languages_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/bases/base_statless_widget.dart';
import '../occasions_section/occasion_item.dart';

// ignore: must_be_immutable
class OccasionsListView extends BaseStatelessWidget {
  const OccasionsListView({super.key, required this.occasions});

  final List<OccasionEntity> occasions;

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
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            homeScreenViewModel.occasionViewModelCubit.initialOccasionSlug =
                occasions[index].slug;
            Navigator.pushNamed(context, DefinedRoutes.occasionScreenRoute);
          },
          child: OccasionItem(
            occasionEntity: occasions[index],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: inherit.screenWidth * 0.04,
        ),
        itemCount: occasions.length,
      ),
    );
  }
}
