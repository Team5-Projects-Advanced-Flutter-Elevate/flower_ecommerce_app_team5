import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api_client/api_client.dart';

@module
abstract class OccasionApiClientProvider {
  @singleton
  OccasionApiClient ApiClient(Dio dio) {
    return OccasionApiClient(dio);
  }
}