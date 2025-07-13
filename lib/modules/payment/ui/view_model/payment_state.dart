import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';

enum Status { initial, loading, success, error }

class PaymentState extends Equatable {
  final Status checkoutSessionStatus;
  final Status cartItemsStatus;
  final CheckoutResponseEntity? checkoutResponseEntity;
  final CartResponseEntity? cartResponseEntity;
  final Object? checkoutSessionsError;
  final Object? cartItemsError;

  const PaymentState(
      {this.checkoutSessionStatus = Status.initial,
      this.cartItemsStatus = Status.initial,
      this.checkoutResponseEntity,
      this.cartResponseEntity,
      this.checkoutSessionsError,
      this.cartItemsError});

  @override
  List<Object?> get props => [
        checkoutSessionStatus,
        cartItemsStatus,
        checkoutResponseEntity,
        cartResponseEntity,
        checkoutSessionsError,
        cartItemsError
      ];

  PaymentState copyWith({
    Status? checkoutSessionStatus,
    Status? cartItemsStatus,
    CheckoutResponseEntity? checkoutResponseEntity,
    CartResponseEntity? cartResponseEntity,
    Object? checkoutSessionsError,
    Object? cartItemsError,
  }) {
    return PaymentState(
        checkoutSessionStatus:
            checkoutSessionStatus ?? this.checkoutSessionStatus,
        cartItemsStatus: cartItemsStatus ?? this.cartItemsStatus,
        checkoutResponseEntity:
            checkoutResponseEntity ?? this.checkoutResponseEntity,
        cartResponseEntity: cartResponseEntity ?? this.cartResponseEntity,
        checkoutSessionsError:
            checkoutSessionsError ?? this.checkoutSessionsError,
        cartItemsError: cartItemsError ?? this.cartItemsError);
  }
}
