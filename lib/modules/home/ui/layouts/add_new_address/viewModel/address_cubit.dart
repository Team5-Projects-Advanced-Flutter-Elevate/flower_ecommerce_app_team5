import 'dart:convert';

import 'package:flower_ecommerce_app_team5/core/apis/api_error/api_error_model.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/get_cities.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cities_states_entity/get_states.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/new_address_repo.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/address_states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';

abstract class AddressIntent {}

class GetSavedAddresses extends AddressIntent {}

class EditAddress extends AddressIntent {
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? name;
  String? username;
  String? id;
  AddressEntity? request;

  EditAddress(
    this.id,
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.request
  );
}

class DeleteAddress extends AddressIntent {
  final String id;

  DeleteAddress(this.id);
}
@Injectable()
class AddressCubit extends Cubit<AddressStates> {
  final NewAddressRepo repository;

  AddressCubit(this.repository) : super(GetSavedAddressesInitialState());
  
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
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> processIntent(AddressIntent intent) async {
    if (intent is GetSavedAddresses) {
      emit(GetSavedAddressesLoadingState());
      try {
        final result = await repository.getSavedAddresses();
        switch (result) {
          case Success<List<AddressModelEntity>>():
            emit(GetSavedAddressesSuccessState(result.data));
          case Error<List<AddressModelEntity>>():
            emit(GetSavedAddressesErrorState(ApiErrorModel(error: result.error.toString())));
        }
      } catch (e) {
        emit(GetSavedAddressesErrorState(ApiErrorModel(error: e.toString())));
      }
    } else if (intent is EditAddress) {
      emit(UpdateAddressLoadingState());
      try {
        final result = await repository.updateAddress(id: intent.id!, request: intent.request!);
        switch (result) {
          case Success<List<AddressModelEntity>>():
            emit(UpdateAddressSuccessState(result.data));
          case Error<List<AddressModelEntity>>():
            emit(UpdateAddressErrorState(ApiErrorModel(error: result.error.toString())));
        }
      } catch (e) {
        emit(UpdateAddressErrorState(ApiErrorModel(error: e.toString())));
      }
    } else if (intent is DeleteAddress) {
      emit(DeleteAddressLoadingState());
      try {
        final result = await repository.deleteAddress(id: intent.id);
        switch (result) {
          case Success<List<AddressModelEntity>>():
            emit(DeleteAddressSuccessState(result.data));
          case Error<List<AddressModelEntity>>():
            emit(DeleteAddressErrorState(ApiErrorModel(error: result.error.toString())));
        }
      } catch (e) {
        emit(DeleteAddressErrorState(ApiErrorModel(error: e.toString())));
      }
    }
  }
}