import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import 'best_seller_list_view.dart';
import '../headline_section.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.29,
      child: Column(
        children: [
          HeadLineSection(
            LocaleKeys.bestSeller.tr(),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          BestSellerListView(),
        ],
      ),
    );
  }
}