import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/cash_order_response/cash_order_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';

abstract interface class PaymentRemoteDataSource {
  Future<ApiResult<CashOrderResponseEntity>> makeCashOrder(
      {required PaymentRequestParametersEntity paymentRequestParameters});
  Future<ApiResult<CheckoutResponseEntity>> makeCheckoutSession(
      {required PaymentRequestParametersEntity paymentRequestParameters});
}
