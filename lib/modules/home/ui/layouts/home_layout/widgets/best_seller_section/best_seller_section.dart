import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../../core/widgets/loading_state_widget.dart';
import '../../../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../../view_model/home_cubit.dart';
import 'best_seller_list_view.dart';
import '../headline_section.dart';

class BestSellerSection extends BaseStatelessWidget {
  const BestSellerSection({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget customBuild(BuildContext context, inherit) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          HeadLineSection(
            LocaleKeys.bestSeller.tr(),
            onTap: () {
              Navigator.pushNamed(context, DefinedRoutes.bestSellerScreenRoute);
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
                    child: state.homeDataResponseEntity?.bestSeller == null ||
                            state.homeDataResponseEntity!.bestSeller!.isEmpty
                        ? Center(
                            child: Text(
                            LocaleKeys.noProductsFound.tr(),
                            style: inherit.theme.textTheme.bodyLarge,
                          ))
                        : BestSellerListView(
                            bestSellers:
                                state.homeDataResponseEntity?.bestSeller ?? [],
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
