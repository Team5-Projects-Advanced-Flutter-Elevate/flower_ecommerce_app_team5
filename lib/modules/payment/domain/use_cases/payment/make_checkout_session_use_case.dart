import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/repository_contract/payment/payment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MakeCheckoutSessionUseCase {
  final PaymentRepository _paymentRepository;
  MakeCheckoutSessionUseCase(this._paymentRepository);

  Future<ApiResult<CheckoutResponseEntity>> call(
      {required PaymentRequestParametersEntity paymentRequestParameters}) {
    return _paymentRepository.makeCheckoutSession(
        paymentRequestParameters: paymentRequestParameters);
  }
}
