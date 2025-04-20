import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/data_source_contract/payment/payment_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/cash_order_response/cash_order_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/repository_contract/payment/payment_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRepository)
class PaymentRepositoryImp implements PaymentRepository {
  final PaymentRemoteDataSource _paymentRemoteDataSource;
  PaymentRepositoryImp(this._paymentRemoteDataSource);
  @override
  Future<ApiResult<CashOrderResponseEntity>> makeCashOrder(
      {required PaymentRequestParametersEntity paymentRequestParameters}) {
    return _paymentRemoteDataSource.makeCashOrder(
        paymentRequestParameters: paymentRequestParameters);
  }

  @override
  Future<ApiResult<CheckoutResponseEntity>> makeCheckoutSession(
      {required PaymentRequestParametersEntity paymentRequestParameters}) {
    return _paymentRemoteDataSource.makeCheckoutSession(
        paymentRequestParameters: paymentRequestParameters);
  }
}
