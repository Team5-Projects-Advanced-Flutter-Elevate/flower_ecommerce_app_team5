import 'package:equatable/equatable.dart';
import '../../../../domain/entities/cart_item_entity.dart';

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
  final List<CartItemEntity>? cartItems;

  const CartState({
    this.status = CartStatus.initial,
    this.error,
    this.cartItems,
  });

  CartState copyWith({
    CartStatus? state,
    Object? error,
    List<CartItemEntity>? cartItems,
  }) {
    return CartState(
      status: state ?? this.status,
      error: error ?? this.error,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        cartItems,
      ];
}
