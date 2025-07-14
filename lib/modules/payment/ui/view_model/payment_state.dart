import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';

enum Status { initial, loading, success, error }

class PaymentState extends Equatable {
  final Status checkoutSessionStatus;
  final Status cartItemsStatus;
  final Status getAllOrdersStatus;
  final CheckoutResponseEntity? checkoutResponseEntity;
  final CartResponseEntity? cartResponseEntity;
  final String? latestOrderId;
  final Object? checkoutSessionsError;
  final Object? cartItemsError;
  final Object? ordersError;

  const PaymentState(
      {this.checkoutSessionStatus = Status.initial,
      this.cartItemsStatus = Status.initial,
      this.getAllOrdersStatus = Status.initial,
      this.checkoutResponseEntity,
      this.cartResponseEntity,
      this.latestOrderId,
      this.checkoutSessionsError,
      this.cartItemsError,
      this.ordersError});

  @override
  List<Object?> get props => [
        checkoutSessionStatus,
        cartItemsStatus,
        getAllOrdersStatus,
        checkoutResponseEntity,
        cartResponseEntity,
        latestOrderId,
        checkoutSessionsError,
        cartItemsError,
        ordersError
      ];

  PaymentState copyWith(
      {Status? checkoutSessionStatus,
      Status? cartItemsStatus,
      Status? getAllOrdersStatus,
      CheckoutResponseEntity? checkoutResponseEntity,
      CartResponseEntity? cartResponseEntity,
      String? latestOrderId,
      Object? checkoutSessionsError,
      Object? cartItemsError,
      Object? ordersError}) {
    return PaymentState(
        checkoutSessionStatus:
            checkoutSessionStatus ?? this.checkoutSessionStatus,
        cartItemsStatus: cartItemsStatus ?? this.cartItemsStatus,
        getAllOrdersStatus: getAllOrdersStatus ?? this.getAllOrdersStatus,
        checkoutResponseEntity:
            checkoutResponseEntity ?? this.checkoutResponseEntity,
        cartResponseEntity: cartResponseEntity ?? this.cartResponseEntity,
        latestOrderId: latestOrderId ?? this.latestOrderId,
        checkoutSessionsError:
            checkoutSessionsError ?? this.checkoutSessionsError,
        cartItemsError: cartItemsError ?? this.cartItemsError,
        ordersError: ordersError ?? this.ordersError);
  }
}
