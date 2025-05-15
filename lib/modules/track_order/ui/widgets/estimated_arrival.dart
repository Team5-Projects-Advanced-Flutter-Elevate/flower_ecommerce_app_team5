import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/bases/base_inherited_widget.dart';
import '../../../../core/bases/base_statless_widget.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../shared_layers/localization/generated/locale_keys.g.dart';

class EstimatedArrival extends BaseStatelessWidget {
  const EstimatedArrival({super.key});

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.estimatedArrival.tr(),
                style: inherit.theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.gray,
                ),
              ),
              Text(
                '03 Sep 2024, 11:00 AM',
                style: inherit.theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: AppColors.white[70],
          height: inherit.screenHeight * 0.035,
        )
      ],
    );
  }
}
