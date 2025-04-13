import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/cart_response_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import '../../../../domain/entities/cart_response_entity/cart_item_entity.dart';

enum CartStatus {
  initial,
  loading,
  success,
  error,
  noAccess,
}

class CartState extends Equatable {
  final CartStatus status;
  final Object? error;
  final CartResponseEntity? cartResponseEntity;

  const CartState({
    this.status = CartStatus.initial,
    this.error,
    this.cartResponseEntity,
  });

  CartState copyWith({
    CartStatus? state,
    Object? error,
    CartResponseEntity? cartResponseEntity,
  }) {
    return CartState(
      status: state ?? status,
      error: error ?? this.error,
      cartResponseEntity: cartResponseEntity ?? this.cartResponseEntity,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        cartResponseEntity,
      ];
}
