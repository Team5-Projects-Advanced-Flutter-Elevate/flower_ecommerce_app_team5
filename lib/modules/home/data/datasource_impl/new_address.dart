import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_executor/api_executor.dart';
import '../api/api_client/home_api_client.dart';
import '../datasource_contract/new_address.dart';

@Injectable(as: NewAddressOnlineDataSource)
class NewAddressOnlineDataSourceImpl implements NewAddressOnlineDataSource {
  final HomeApiClient _ApiClient;

  NewAddressOnlineDataSourceImpl(this._ApiClient);
  @override
  Future<void> addAddress(
      var street, var phone, var city, var lat, var long, var name) async {
    // TODO: implement addAddress
    print(city);
    print(phone);
    print(lat);
    print(long);
    print(name);

    final map = {
      "street": street,
      "phone": phone,
      "city": city,
      "lat": lat,
      "long": long,
      "username": name,
    };

    await ApiExecutor.executeApi(
        () async => await _ApiClient.saveAddress(map));
  }
}
