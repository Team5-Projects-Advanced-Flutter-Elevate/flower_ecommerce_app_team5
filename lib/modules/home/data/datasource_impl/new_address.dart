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
}
