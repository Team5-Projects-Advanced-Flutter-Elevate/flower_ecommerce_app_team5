import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/cash_order_response/cash_order_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/checkout_session_response/checkout_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/payment_request_parameters/payment_request_parameters.dart';
import 'package:retrofit/retrofit.dart';
part 'payment_api_client.g.dart';

@RestApi()
abstract class PaymentApiClient {
  factory PaymentApiClient(Dio dio) = _PaymentApiClient;

  @POST(ApisEndpoints.cashOrderEndpoint)
  Future<CashOrderResponseDto> makeCashOrder(
      @Body() PaymentRequestParametersDto paymentRequestParameters);

  @POST(ApisEndpoints.checkoutSessionEndpoint)
  Future<CheckoutResponseDto> makeCheckoutSession(@Body() PaymentRequestParametersDto paymentRequestParameters);
}
