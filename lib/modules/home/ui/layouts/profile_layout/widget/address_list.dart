import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/address_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/address_states.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/widget/custom_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends BaseStatefulWidgetState<AddressList> {
  final AddressCubit viewModel = getIt.get<AddressCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.processIntent(GetSavedAddresses());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<AddressCubit, AddressStates>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (state is GetSavedAddressesLoadingState ||
                        state is UpdateAddressLoadingState ||
                        state is DeleteAddressLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetSavedAddressesSuccessState) {
                      return state.addresses.isEmpty
                          ? Center(child: Text(context.locale == const Locale('en')?'No addresses found':'لا يوجد عناوين'))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.addresses.length,
                              itemBuilder: (context, index) {
                                return FadeInRight(
                                  animate: true,
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 120 * (index + 1)),
                                  child: CustomCardItem(
                                    address: state.addresses[index],
                                  ),
                                );
                              },
                            );
                    } else if (state is DeleteAddressSuccessState) {
                      return state.addresses.isEmpty
                          ? Center(child: Text(context.locale == const Locale('en')?'No addresses found':'لا يوجد عناوين'))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.addresses.length,
                              itemBuilder: (context, index) {
                                return FadeInLeft(
                                  animate: true,
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 120 * (index + 1)),
                                  child: CustomCardItem(
                                    address: state.addresses[index],
                                  ),
                                );
                              },
                            );
                    } else if (state is UpdateAddressSuccessState) {
                      return state.addresses.isEmpty
                          ? Center(child: Text(context.locale == const Locale('en')?'No addresses found':'لا يوجد عناوين'))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.addresses.length,
                              itemBuilder: (context, index) {
                                return FadeInRight(
                                  animate: true,
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 120 * (index + 1)),
                                  child: CustomCardItem(
                                    address: state.addresses[index],
                                  ),
                                );
                              },
                            );
                    } else if (state is GetSavedAddressesErrorState ||
                               state is UpdateAddressErrorState ||
                               state is DeleteAddressErrorState) {
                      return Center(
                        child: Text(
                          'Error: ${state is GetSavedAddressesErrorState ? state.errorModel.error : (state as dynamic).errorModel.message}',
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}