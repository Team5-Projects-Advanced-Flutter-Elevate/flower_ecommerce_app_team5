import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_state.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../core/colors/app_colors.dart';
import 'address_item.dart';

class DeliveryAddressSection extends StatefulWidget {
  const DeliveryAddressSection({super.key});

  @override
  State<DeliveryAddressSection> createState() => _DeliveryAddressSectionState();
}

class _DeliveryAddressSectionState
    extends BaseStatefulWidgetState<DeliveryAddressSection> {
  late CheckOutCubit cubit;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit = BlocProvider.of<CheckOutCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              LocaleKeys.deliveryAddress.tr(),
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 14 * (screenWidth / 375),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CheckOutCubit, CheckOutState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                switch (state.status) {
                  case LoadCheckoutAddressesStatus.initial:
                  case LoadCheckoutAddressesStatus.loading:
                    return const LoadingWidget();
                  case LoadCheckoutAddressesStatus.success:
                    final addresses =
                        state.addressesResponseEntity?.addresses ?? [];
                    return Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Expanded(
                          child: addresses.isEmpty
                              ? Center(
                                  child: Text(
                                    LocaleKeys.noAddressesFound.tr(),
                                  ),
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) => AddressItem(
                                    addressModel: state.addressesResponseEntity
                                            ?.addresses?[index] ??
                                        AddressModelEntity(),
                                  ),
                                  itemCount: state.addressesResponseEntity
                                          ?.addresses?.length ??
                                      0,
                                ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            var newAddress =
                                await Navigator.pushNamed(
                              context,
                              DefinedRoutes.addNewAddress,
                            );
                            if (newAddress != null) {
                              cubit.doIntent(GetAllAddressesIntent());
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                              ),
                              Text(
                                LocaleKeys.addNew.tr(),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  case LoadCheckoutAddressesStatus.error:
                    return ErrorStateWidget(error: state.error!);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
