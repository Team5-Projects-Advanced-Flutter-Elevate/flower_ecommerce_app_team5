import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/use_cases/payment/make_checkout_session_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/ui/view_model/payment_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentViewModel extends Cubit<PaymentState> {
  final MakeCheckoutSessionUseCase _makeCheckoutSessionUseCase;
  //late CheckoutResponseEntity _checkoutResponseEntity;
  final GetCartItemsUseCase _getCartItemsUseCase;

  PaymentViewModel(this._makeCheckoutSessionUseCase, this._getCartItemsUseCase)
      : super(const PaymentState());

  void doIntent(PaymentIntent intent) {
    switch (intent) {
      case MakeCheckoutSessionIntent():
        _makeCheckoutSession(
            paymentRequestParameters: intent.paymentRequestParameters);
        break;
      case GetCartItemsIntent():
       _getCartItems();
       break;
    }
  }

  void _makeCheckoutSession(
      {required PaymentRequestParametersEntity
          paymentRequestParameters}) async {
    emit(const PaymentState(checkoutSessionStatus: Status.loading));
    var useCaseResult = await _makeCheckoutSessionUseCase(
        paymentRequestParameters: paymentRequestParameters);

    switch (useCaseResult) {
      case Success<CheckoutResponseEntity>():
        //_checkoutResponseEntity = useCaseResult.data;
        emit(state.copyWith(
            checkoutSessionStatus: Status.success,
            checkoutResponseEntity: useCaseResult.data));
      case Error<CheckoutResponseEntity>():
        emit(state.copyWith(
            checkoutSessionStatus: Status.error,
            checkoutSessionsError: useCaseResult.error));
    }
  }

  void _getCartItems() async {
    emit(state.copyWith(cartItemsStatus: Status.loading));
    var useCaseResult = await _getCartItemsUseCase.execute();
    switch (useCaseResult) {
      case Success<CartResponseEntity>():
        emit(state.copyWith(
            cartItemsStatus: Status.success,
            cartResponseEntity: useCaseResult.data));
      case Error<CartResponseEntity>():
        emit(state.copyWith(
            cartItemsStatus: Status.error,
            cartItemsError: useCaseResult.error));
    }
  }
}

sealed class PaymentIntent {}

class MakeCheckoutSessionIntent extends PaymentIntent {
  final PaymentRequestParametersEntity paymentRequestParameters;

  MakeCheckoutSessionIntent({required this.paymentRequestParameters});
}
class GetCartItemsIntent extends PaymentIntent{}
