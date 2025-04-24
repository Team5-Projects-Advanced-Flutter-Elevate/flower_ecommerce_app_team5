import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/new_address_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/states.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/cities_states_entity/get_cities.dart';
import '../../../../domain/entities/cities_states_entity/get_states.dart';
import '../../../../domain/entities/new_address_response.dart';

@injectable
class NewAddressViewModelCubit extends Cubit<AddressState> {
  NewAddressUseCase newAddressUseCase;
  NewAddressViewModelCubit(this.newAddressUseCase) : super(AddressInitial());
  void processIntent(NewAddressOnIntent intent) {
    switch (intent) {
      case AddAddress():
        _saveAddress(intent.street,intent.phone,intent.city,intent.long,intent.long,intent.name);
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

  Future<void> _saveAddress(var street,var phone,var city,var lat,var long,var name) async {
    emit(AddressLoading()); // Emit loading state
    try {
      await newAddressUseCase.call(street,phone,city,lat,long,name);
      emit(AddressSuccess()); // Emit success state with message
    } catch (e) {
      emit(AddressError(e.toString())); // Emit error state with error message
    }
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
        print("No location found for the country.");
        return null;
      }
    } catch (e) {
      print("Error getting coordinates: $e");
      return null;
    }
  }
}

sealed class NewAddressOnIntent {}

class AddAddress extends NewAddressOnIntent {
  var street;
  var phone;
  var city;
  var lat;
  var long;
  var name;
  AddAddress(this.street,this.phone,this.city,this.lat,this.long,this.name);
}
