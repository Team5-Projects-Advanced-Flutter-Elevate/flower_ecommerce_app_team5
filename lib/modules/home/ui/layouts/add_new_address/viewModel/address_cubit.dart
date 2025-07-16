import 'dart:convert';
import 'package:flower_ecommerce_app_team5/core/apis/api_error/api_error_model.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/get_cities.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/get_states.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/delete_address_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/edit_address_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/address_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressCubit extends Cubit<AddressStates> {
  EditAddressUseCase editAddressUseCase;
  DeleteAddressUseCase deleteAddressUseCase;

  AddressCubit(this.editAddressUseCase, this.deleteAddressUseCase)
      : super(GetSavedAddressesInitialState());

  void processIntent(NewAddressOnIntent intent) {
    switch (intent) {
      case EditAddress():
        _updateAddress(intent.id, intent.request, intent.street, intent.phone,
            intent.city, intent.long, intent.long, intent.name);
        break;
      case DeleteAddress():
        _deleteAddress(intent.addressId);
        break;
    }
  }

  Future<List<GetCities>> loadGovernorates() async {
    final jsonString = await rootBundle.loadString('assets/files/cities.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    final tableEntry = jsonList.firstWhere(
      (entry) => entry['type'] == 'table' && entry['name'] == 'governorates',
      orElse: () => {},
    );

    final data = tableEntry['data'] as List<dynamic>;

    return data.map((e) => GetCities.fromJson(e)).toList();
  }

  Future<List<City>> loadCities() async {
    final jsonString = await rootBundle.loadString('assets/files/states.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    final tableEntry = jsonList.firstWhere(
      (entry) => entry['type'] == 'table' && entry['name'] == 'cities',
      orElse: () => {},
    );

    final data = tableEntry['data'] as List<dynamic>;
    return data.map((e) => City.fromJson(e)).toList();
  }

  Future<Map<String, double>?> getLatLongFromCountry(String country) async {
    try {
      List<Location> locations = await locationFromAddress(country);

      if (locations.isNotEmpty) {
        Location location = locations.first;

        return {
          'latitude': location.latitude,
          'longitude': location.longitude,
        };
      } else {
        debugPrint("No location found for the country.");
        return null;
      }
    } catch (e) {
      debugPrint("Error getting coordinates: $e");
      return null;
    }
  }

  _deleteAddress(var addressId) async {
    emit(DeleteAddressLoadingState());
    var response = await deleteAddressUseCase(addressId);
    switch (response) {
      case Success<List<AddressEntity>>():
        emit(DeleteAddressSuccessState(response.data));
      case Error():
        emit(
            DeleteAddressErrorState(ApiErrorModel(error: response.toString())));
    }
  }

  _updateAddress(
    var addressId,
    AddressEntity request,
    var street,
    var phone,
    var city,
    var lat,
    var long,
    var name,
  ) async {
    emit(UpdateAddressLoadingState());
    var response = await editAddressUseCase(
      addressId,
      request,
      street,
      phone,
      city,
      lat,
      long,
    );
    switch (response) {
      case Success<List<AddressEntity>>():
        emit(UpdateAddressSuccessState(response.data));
      case Error():
        emit(
            UpdateAddressErrorState(ApiErrorModel(error: response.toString())));
    }
  }
}

sealed class NewAddressOnIntent {}

class EditAddress extends NewAddressOnIntent {
  AddressEntity request;
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? name;
  String? id;
  EditAddress(this.street, this.phone, this.city, this.lat, this.long,
      this.name, this.id, this.request);
}

class DeleteAddress extends NewAddressOnIntent {
  String? addressId;
  DeleteAddress(this.addressId);
}
