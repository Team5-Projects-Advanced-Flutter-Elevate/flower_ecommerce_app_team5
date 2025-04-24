import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/use_cases/payment/make_checkout_session_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/ui/view_model/payment_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentViewModel extends Cubit<PaymentState> {
  final MakeCheckoutSessionUseCase _makeCheckoutSessionUseCase;
  //late CheckoutResponseEntity _checkoutResponseEntity;

  PaymentViewModel(this._makeCheckoutSessionUseCase)
      : super(const PaymentState());

  void doIntent(PaymentIntent intent) {
    switch (intent) {
      case MakeCheckoutSessionIntent():
        _makeCheckoutSession(
            paymentRequestParameters: intent.paymentRequestParameters);
        break;
    }
  }

  void _makeCheckoutSession(
      {required PaymentRequestParametersEntity
          paymentRequestParameters}) async {
    emit(const PaymentState(checkoutSessionStatus: PaymentStatus.loading));
    var useCaseResult = await _makeCheckoutSessionUseCase(
        paymentRequestParameters: paymentRequestParameters);

    switch (useCaseResult) {
      case Success<CheckoutResponseEntity>():
        //_checkoutResponseEntity = useCaseResult.data;
        emit(PaymentState(
            checkoutSessionStatus: PaymentStatus.success,
            checkoutResponseEntity: useCaseResult.data));
      case Error<CheckoutResponseEntity>():
        emit(PaymentState(
            checkoutSessionStatus: PaymentStatus.error,
            error: useCaseResult.error));
    }
  }
}

sealed class PaymentIntent {}

class MakeCheckoutSessionIntent extends PaymentIntent {
  final PaymentRequestParametersEntity paymentRequestParameters;

  MakeCheckoutSessionIntent({required this.paymentRequestParameters});
}