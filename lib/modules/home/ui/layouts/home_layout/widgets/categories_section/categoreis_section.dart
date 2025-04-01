import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';

import 'categoreis_list_view.dart';
import '../headline_section.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.16,
      child: Column(
        children: [
          HeadLineSection(
            LocaleKeys.categories.tr(),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          CategoriesListView(),
        ],
      ),
    );
  }
}