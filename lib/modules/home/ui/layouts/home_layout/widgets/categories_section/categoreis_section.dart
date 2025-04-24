import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/view_model/home_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
    HomeScreenViewModel homeScreenViewModel = Provider.of(context);
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          HeadLineSection(
            LocaleKeys.categories.tr(),
            onTap: () {
              homeScreenViewModel.selectedAppSectionIndex = 1;
              homeScreenViewModel.doIntent(JumpToPage(pageIndex: 1));
            },
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state.state) {
                case HomeStatus.initial:
                case HomeStatus.loading:
                  return const Expanded(
                    child: LoadingWidget(),
                  );
                case HomeStatus.success:
                  return Expanded(
                    child: CategoriesListView(
                      categories:
                          state.homeDataResponseEntity?.categories ?? [],
                    ),
                  );
                case HomeStatus.error:
                  return ErrorStateWidget(error: state.error!);
              }
            },
          ),
        ],
      ),
    );
  }
}
