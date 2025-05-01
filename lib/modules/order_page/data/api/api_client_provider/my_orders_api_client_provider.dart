import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api_client/my_orders_api_client.dart';

@module
abstract class MyOrdersApiClientProvider {
  @singleton
  MyOrdersApiClient apiClient(Dio dio) {
    return MyOrdersApiClient(dio);
  }
}