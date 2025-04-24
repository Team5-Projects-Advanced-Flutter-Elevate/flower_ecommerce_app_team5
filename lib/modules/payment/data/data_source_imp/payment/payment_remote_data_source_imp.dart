import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/api/api_client/payment_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/data_source_contract/payment/payment_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/cash_order_response/cash_order_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/checkout_session_response/checkout_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/payment_request_parameters/payment_request_parameters.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/cash_order_response/cash_order_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRemoteDataSource)
class PaymentRemoteDataSourceImp implements PaymentRemoteDataSource {
  final PaymentApiClient _paymentApiClient;
  PaymentRemoteDataSourceImp(this._paymentApiClient);
  @override
  Future<ApiResult<CashOrderResponseEntity>> makeCashOrder(
      {required PaymentRequestParametersEntity
          paymentRequestParameters}) async {
    var apiResult = await ApiExecutor.executeApi(
      () {
        return _paymentApiClient.makeCashOrder(
            PaymentRequestParametersDto.convertEntityIntoDto(
                paymentRequestParameters));
      },
    );
    switch (apiResult) {
      case Success<CashOrderResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<CashOrderResponseDto>():
        return Error(error: apiResult.error);
    }
  }

  @override
  Future<ApiResult<CheckoutResponseEntity>> makeCheckoutSession(
      {required PaymentRequestParametersEntity paymentRequestParameters}) async{
    var apiResult = await ApiExecutor.executeApi(
          () {
        return _paymentApiClient.makeCheckoutSession(
            PaymentRequestParametersDto.convertEntityIntoDto(
                paymentRequestParameters));
      },
    );
    switch (apiResult) {
      case Success<CheckoutResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<CheckoutResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
