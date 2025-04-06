import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/bases/base_statless_widget.dart';
import '../occasions_section/occasion_item.dart';

class OccasionsListView extends BaseStatelessWidget {
  OccasionsListView({super.key, required this.occasions});

  final List<OccasionEntity> occasions;

  @override
  Widget customBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => OccasionItem(
          occasionEntity: occasions[index],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
        itemCount: occasions.length,
      ),
    );
  }
}
