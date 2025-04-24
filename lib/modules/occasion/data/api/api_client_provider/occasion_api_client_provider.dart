import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api_client/api_client.dart';

@module
abstract class OccasionApiClientProvider {
  @singleton
  OccasionApiClient apiClient(Dio dio) {
    return OccasionApiClient(dio);
  }
}