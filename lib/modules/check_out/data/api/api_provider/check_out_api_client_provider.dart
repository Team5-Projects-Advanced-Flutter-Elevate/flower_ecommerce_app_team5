import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api_client/check_out_api_client.dart';

@module
abstract class CheckOutApiClientProvider {
  @lazySingleton
  CheckOutApiClient providerApiClient(Dio dio) {
    return CheckOutApiClient(dio);
  }
}
