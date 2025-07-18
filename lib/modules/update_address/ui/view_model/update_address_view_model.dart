import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/city_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/governorate_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/new_address_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/data/models/update_address_request.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/domain/use_cases/update_address_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/ui/view_model/update_address_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateAddressViewModel extends Cubit<UpdateAddressState> {
  final NewAddressViewModelCubit _newAddressViewModel;
  final UpdateAddressUseCase _updateAddressUseCase;
  UpdateAddressViewModel(this._newAddressViewModel, this._updateAddressUseCase)
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
  bool didAddressUpdated = false;

  void doIntent(UpdateAddressIntent intent) {
    switch (intent) {
      case InitializeData():
        _initializeData(intent.addressEntity);
        break;
      case OnOneOfTheFieldsChange():
        _onOneOfTheFieldsChange();
        break;
      case UpdateAddressCall():
        _updateAddress();
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

  void _updateAddress() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(updateAddressStatus: Status.loading));
      String lat = '', long = '';
      if (selectedCity == _oldAddressEntity.city) {
        lat = _oldAddressEntity.lat ?? "";
        long = _oldAddressEntity.long ?? "";
      } else {
        var location = await _newAddressViewModel
            .getLatLongFromCountry("$selectedGovernorate $selectedCity");
        lat = (location?['latitude'] ?? "").toString();
        long = (location?['longitude'] ?? "").toString();
      }
      UpdateAddressRequest updateAddressRequest = UpdateAddressRequest(
          username: recipientController.text,
          city: selectedCity,
          lat: lat,
          long: long,
          street: addressController.text,
          phone: phoneController.text);
      var useCaseResult = await _updateAddressUseCase.call(
          addressId: _oldAddressEntity.id ?? "",
          updateAddressRequest: updateAddressRequest);
      switch (useCaseResult) {
        case Success<String>():
          didAddressUpdated = true;
          _oldAddressEntity = AddressEntity(
              username: updateAddressRequest.username,
              phone: updateAddressRequest.phone,
              street: updateAddressRequest.street,
              city: updateAddressRequest.city,
              lat: updateAddressRequest.lat,
              long: updateAddressRequest.long,
              id: _oldAddressEntity.id);
          emit(state.copyWith(updateAddressStatus: Status.success));
          _onOneOfTheFieldsChange();
        case Error<String>():
          emit(state.copyWith(
              updateAddressStatus: Status.error,
              updateAddressError: useCaseResult.error));
      }
    }
  }
}

sealed class UpdateAddressIntent {}

class InitializeData extends UpdateAddressIntent {
  final AddressEntity addressEntity;
  InitializeData({required this.addressEntity});
}

class OnOneOfTheFieldsChange extends UpdateAddressIntent {}

class UpdateAddressCall extends UpdateAddressIntent {}
