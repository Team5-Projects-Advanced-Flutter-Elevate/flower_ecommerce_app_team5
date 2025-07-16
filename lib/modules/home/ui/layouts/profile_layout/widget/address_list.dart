import 'package:animate_do/animate_do.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/get_cities.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/get_states.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
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
  List<GetCities> governorates = [];
  List<City> allCities = [];
  List<City> filteredCities = [];
  late String? selectedGovernorate;
  late String selectedGovernorateId;
  late String? selectedArea;

  AddressCubit viewModel = getIt.get<AddressCubit>();
  AddressEntity? newAddress;

  @override
  void initState() {
    super.initState();
    viewModel.loadGovernorates().then((value) {
      setState(() {
        governorates = value;
        selectedGovernorate = governorates.first.nameEn;
      });
    });
    viewModel.loadCities().then((value) {
      setState(() {
        allCities = value;
        selectedArea = allCities.first.cityNameEn;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          viewModel..processIntent(EditAddress(newAddress!.id, newAddress!.street, newAddress!.phone, newAddress!.city, newAddress!.lat, newAddress!.long, newAddress!.username,newAddress!))..processIntent(DeleteAddress(newAddress!.id)),
      child: BlocBuilder<AddressCubit, AddressStates>(
        builder: (context, state) {
          if (state is GetSavedAddressesLoadingState ||
              state is UpdateAddressLoadingState ||
              state is DeleteAddressLoadingState ) {
            return const CircularProgressIndicator();
          } else if (state is GetSavedAddressesSuccessState) {
            return SizedBox(
              height: state.addresses.length * MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.addresses.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                      animate: true,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 120 * (index + 1)),
                      child: CustomCardItem(
                        address: state.addresses[index],
                      ));
                },
              ),
            );
          } else if (state is DeleteAddressSuccessState) {
            return SizedBox(
              height: state.addresses.length * MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.addresses.length,
                itemBuilder: (context, index) {
                  return FadeInLeft(
                      animate: true,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 120 * (index + 1)),
                      child: CustomCardItem(
                        address: state.addresses[index],
                      ));
                },
              ),
            );
          } else if (state is UpdateAddressSuccessState) {
            return SizedBox(
              height: state.addresses.length * MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.addresses.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                      animate: true,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 120 * (index + 1)),
                      child: CustomCardItem(
                        address: state.addresses[index],
                      ));
                },
              ),
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}