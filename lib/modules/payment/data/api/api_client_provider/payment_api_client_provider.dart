import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/api/api_client/payment_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PaymentApiClientProvider {
  @lazySingleton
  PaymentApiClient providerApiClient(Dio dio) {
    return PaymentApiClient(dio);
  }
}
