import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/city_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/governorate_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/new_address_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/ui/view_model/update_address_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateAddressViewModel extends Cubit<UpdateAddressState> {
  final NewAddressViewModelCubit _newAddressViewModel;
  UpdateAddressViewModel(this._newAddressViewModel)
      : super(const UpdateAddressState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController recipientController = TextEditingController();

  late AddressEntity _oldAddressEntity;
  ValueNotifier<bool> isUpdateButtonEnabledNotifier = ValueNotifier(false);
  String selectedGovernorate = '';
  String selectedGovernorateId = '';
  String selectedCity = '';
  List<Governorate> governorates = [];
  List<City> allCities = [];
  List<City> citiesOfSelectedGovernorate = [];

  void doIntent(UpdateAddressIntent intent) {
    switch (intent) {
      case InitializeData():
        _initializeData(intent.addressEntity);
        break;
      case OnOneOfTheFieldsChange():
        _onOneOfTheFieldsChange();
        break;
    }
  }

  void _initializeData(AddressEntity addressEntity) async {
    try {
      _oldAddressEntity = addressEntity;
      emit(const UpdateAddressState(initializingDataStatus: Status.loading));
      addressController.text = addressEntity.street ?? "";
      phoneController.text = addressEntity.phone ?? '';
      recipientController.text = addressEntity.username ?? "";
      selectedCity = addressEntity.city ?? "";
      governorates = await _newAddressViewModel.loadGovernorates();
      allCities = await _newAddressViewModel.loadCities();
      var selectCityItem = allCities.firstWhere(
        (city) {
          return city.cityNameEn == addressEntity.city;
        },
      );
      selectedGovernorateId = selectCityItem.governorateId;
      selectedGovernorate = governorates.firstWhere(
        (g) {
          return g.id == selectCityItem.governorateId;
        },
      ).nameEn;
      citiesOfSelectedGovernorate = allCities.where(
        (city) {
          return city.governorateId == selectedGovernorateId;
        },
      ).toList();
      emit(state.copyWith(initializingDataStatus: Status.success));
    } catch (error) {
      emit(state.copyWith(
          initializingDataStatus: Status.error, initializingDataError: error));
    }
  }

  void _onOneOfTheFieldsChange() {
    if (addressController.text != _oldAddressEntity.street ||
        phoneController.text != _oldAddressEntity.phone ||
        recipientController.text != _oldAddressEntity.username ||
        selectedCity != _oldAddressEntity.city) {
      isUpdateButtonEnabledNotifier.value = true;
    } else {
      isUpdateButtonEnabledNotifier.value = false;
    }
  }
}

sealed class UpdateAddressIntent {}

class InitializeData extends UpdateAddressIntent {
  final AddressEntity addressEntity;
  InitializeData({required this.addressEntity});
}

class OnOneOfTheFieldsChange extends UpdateAddressIntent{}
