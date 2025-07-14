import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/domain/entity/order_page_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/domain/usecase/order_page.dart';
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
  final OrderPageUseCase _orderPageUseCase;

  PaymentViewModel(this._makeCheckoutSessionUseCase, this._getCartItemsUseCase,
      this._orderPageUseCase)
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
      case GetLatestOrderIdIntent():
        _getLatestOrderId();
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

  void _getLatestOrderId() async {
    emit(state.copyWith(getAllOrdersStatus: Status.loading));
    var useCaseResult = await _orderPageUseCase.getMyOrder();
    switch (useCaseResult) {
      case Success<GetMyOrdersEntity>():
        String? latestOrderId =
            _getNewestOrder(useCaseResult.data.orderEntities);
        emit(state.copyWith(
            getAllOrdersStatus: Status.success, latestOrderId: latestOrderId));
      case Error<GetMyOrdersEntity>():
        emit(state.copyWith(
            getAllOrdersStatus: Status.error,
            ordersError: useCaseResult.error));
    }
  }

  String? _getNewestOrder(List<OrderEntity> orders) {
    if (orders.isEmpty) return null;
    OrderEntity order = orders.firstWhere(
      (element) => element.isPaid == true,
    );
    for (var elem in orders) {
      if (elem.isPaid == true) {
        DateTime elemPayingDate = DateTime.parse(elem.paidAt!);
        if (!(DateTime.parse(order.paidAt!).isAfter(elemPayingDate))) {
          order = elem;
        }
      }
    }
    return order.id;
  }
}

sealed class PaymentIntent {}

class MakeCheckoutSessionIntent extends PaymentIntent {
  final PaymentRequestParametersEntity paymentRequestParameters;

  MakeCheckoutSessionIntent({required this.paymentRequestParameters});
}

class GetCartItemsIntent extends PaymentIntent {}
class GetLatestOrderIdIntent extends PaymentIntent {}
