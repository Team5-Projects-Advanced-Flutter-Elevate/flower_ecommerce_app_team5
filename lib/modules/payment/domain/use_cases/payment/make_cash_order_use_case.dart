import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/cash_order_response/cash_order_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/repository_contract/payment/payment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MakeCashOrderUseCase {
  final PaymentRepository _paymentRepository;
  MakeCashOrderUseCase(this._paymentRepository);

  Future<ApiResult<CashOrderResponseEntity>> call(
      {required PaymentRequestParametersEntity paymentRequestParameters}) {
    return _paymentRepository.makeCashOrder(
        paymentRequestParameters: paymentRequestParameters);
  }
}
