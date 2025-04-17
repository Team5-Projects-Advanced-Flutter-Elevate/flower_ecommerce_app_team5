import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../../core/widgets/loading_state_widget.dart';
import '../../view_model/home_cubit.dart';
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
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          HeadLineSection(
            LocaleKeys.occasions.tr(),
            onTap: () {
              Navigator.pushNamed(context, DefinedRoutes.occasionScreenRoute);
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
                    child: OccasionsListView(
                      occasions: state.homeDataResponseEntity?.occasions ?? [],
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
