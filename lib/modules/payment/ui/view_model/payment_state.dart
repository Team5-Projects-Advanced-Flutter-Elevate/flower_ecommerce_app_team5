import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';

enum PaymentStatus { initial, loading, success, error }

class PaymentState extends Equatable {
  final PaymentStatus checkoutSessionStatus;
  final CheckoutResponseEntity? checkoutResponseEntity;
  final Object? error;

  const PaymentState(
      {this.checkoutSessionStatus = PaymentStatus.initial,
      this.checkoutResponseEntity,
      this.error});

  @override
  List<Object?> get props =>
      [checkoutSessionStatus, checkoutResponseEntity, error];
}
