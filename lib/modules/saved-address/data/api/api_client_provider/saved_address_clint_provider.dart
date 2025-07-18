import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api_client/saved_address_api_client.dart';

@module
abstract class AddressApiClientProvider {
  @singleton
  SavedAddressApiClient apiClient(Dio dio) {
    return SavedAddressApiClient(dio);
  }
}
