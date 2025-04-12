import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../../core/widgets/loading_state_widget.dart';
import '../../../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../../view_model/home_cubit.dart';
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
    return Expanded(
      flex:3,
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
                    child: BestSellerListView(
                      bestSellers: state.homeDataResponseEntity?.bestSeller ?? [],
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
