import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_error/api_error_handler.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import '../headline_section.dart';
import 'occasions_list_view.dart';

class OccasionsSection extends StatelessWidget {
  const OccasionsSection({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.27,
      child: Column(
        children: [
          HeadLineSection(
            LocaleKeys.occasions.tr(),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          OccasionsListView(),
        ],
      ),
    );
  }
}