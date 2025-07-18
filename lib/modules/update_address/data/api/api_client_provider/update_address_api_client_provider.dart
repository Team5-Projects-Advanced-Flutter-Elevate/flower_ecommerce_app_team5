import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/data/api/api_client/update_address_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UpdateAddressApiClientProvider {
  @lazySingleton
  UpdateAddressApiClient provide(Dio dio) {
    return UpdateAddressApiClient(dio);
  }
}
