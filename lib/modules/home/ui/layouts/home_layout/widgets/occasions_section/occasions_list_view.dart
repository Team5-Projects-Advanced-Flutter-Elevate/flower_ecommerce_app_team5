import 'package:flutter/material.dart';

import '../../../../../../../core/bases/base_statless_widget.dart';
import '../occasions_section/occasion_item.dart';

class OccasionsListView extends BaseStatelessWidget {
  OccasionsListView({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return Container(
      height: screenHeight * 0.22,
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => OccasionItem(),
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.04,
        ),
        itemCount: 10,
      ),
    );
  }
}
