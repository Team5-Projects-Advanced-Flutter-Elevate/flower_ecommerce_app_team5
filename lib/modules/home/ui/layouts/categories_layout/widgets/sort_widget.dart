import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/widgets/show_sort_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/constants/constants.dart';
import '../view_model/categories_layout_view_model.dart';

class SortWidget extends StatefulWidget {
  const SortWidget({
    super.key,
    required this.viewModel,
  });
  final CategoriesLayoutViewModel viewModel;

  @override
  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends BaseStatefulWidgetState<SortWidget> {
  //CategoriesLayoutViewModel cubit = getIt.get<CategoriesLayoutViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
          onPressed: () {
            showSortBottomSheet(
                viewModel: widget.viewModel,
                context: context,
                theme: theme,
                screenWidth: screenWidth);
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(100 * (screenWidth / Constants.designWidth),
                  34 * (screenWidth / Constants.designWidth)),
              padding: const EdgeInsets.symmetric(horizontal: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.tune_outlined,
                size: 18 * (screenWidth / Constants.designWidth),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Text(
                'filter',
                style: theme.textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 13 * (screenWidth / Constants.designWidth),
                    color: AppColors.white),
              )
            ],
          )),
    );
  }
}
