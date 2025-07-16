import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_executor/api_executor.dart';
import '../api/api_client/home_api_client.dart';
import '../datasource_contract/new_address.dart';

@Injectable(as: NewAddressOnlineDataSource)
class NewAddressOnlineDataSourceImpl implements NewAddressOnlineDataSource {
  final HomeApiClient _apiClient;

  NewAddressOnlineDataSourceImpl(this._apiClient);
  @override
  Future<void> addAddress(
      var street, var phone, var city, var lat, var long, var name) async {
    // TODO: implement addAddress
    debugPrint(city);
    debugPrint(phone);
    debugPrint(lat);
    debugPrint(long);
    debugPrint(name);

    final map = {
      "street": street,
      "phone": phone,
      "city": city,
      "lat": lat,
      "long": long,
      "username": name,
    };

    await ApiExecutor.executeApi(
        () async => await _apiClient.saveAddress(map));
  }

  @override
  Future<ApiResult<List<AddressModelEntity>>>  deleteAddress(
      {required String id}) async {

    final map = {
      "_id": id
    };
    return await ApiExecutor.executeApi(
        () async => await _apiClient.deleteAddress(map));
  }

  @override
  Future<ApiResult<List<AddressModelEntity>>>  updateAddress(
      {required String id, required AddressEntity request}) async {
    final map = {
      "street": request.street,
      "phone": request.phone,
      "city": request.city,
      "lat": request.lat,
      "long": request.long,
      "username": request.username,
      "_id": id
    };
    return await ApiExecutor.executeApi(
        () async => await _apiClient.editAddress(map));
  }
}
