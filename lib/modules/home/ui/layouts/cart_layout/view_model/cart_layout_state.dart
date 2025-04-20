import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';

enum CartStatus {
  initial,
  loading,
  success,
  error,
  noAccess,
}

enum UserLoginStatus { loggedIn, guest }

enum CounterStatus {
  increment,
  decrement,
}

enum AddToCartStatus {
  initial,
  loading,
  success,
  error,
  noAccess,
}

enum DeleteFromCartStatus {
  initial,
  loading,
  success,
  error,
}

// ignore: must_be_immutable
class CartState extends Equatable {
  final CartStatus status;
  final UserLoginStatus userLoginStatus;
  final Object? error;
  final CartResponseEntity? cartResponseEntity;
  final CounterStatus? counterStatus;
  final AddToCartStatus addToCartStatus;
  final DeleteFromCartStatus deleteFromCartStatus;

  int totalPrice;

  CartState(
      {this.status = CartStatus.initial,
      this.error,
      this.cartResponseEntity,
      this.totalPrice = 0,
      this.counterStatus,
      this.addToCartStatus = AddToCartStatus.initial,
      this.deleteFromCartStatus = DeleteFromCartStatus.initial,
      this.userLoginStatus = UserLoginStatus.loggedIn});

  CartState copyWith({
    CartStatus? state,
    UserLoginStatus? userLoginStatus,
    Object? error,
    CartResponseEntity? cartResponseEntity,
    int? totalPrice,
    CounterStatus? counterStatus,
    AddToCartStatus? addToCartStatus,
    DeleteFromCartStatus? deleteFromCartStatus,
  }) {
    return CartState(
      status: state ?? status,
      userLoginStatus: userLoginStatus ?? this.userLoginStatus,
      error: error ?? this.error,
      cartResponseEntity: cartResponseEntity ?? this.cartResponseEntity,
      totalPrice: totalPrice ?? this.totalPrice,
      counterStatus: counterStatus ?? this.counterStatus,
      addToCartStatus: addToCartStatus ?? this.addToCartStatus,
      deleteFromCartStatus: deleteFromCartStatus ?? this.deleteFromCartStatus,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        cartResponseEntity,
        totalPrice,
        counterStatus,
        addToCartStatus,
        deleteFromCartStatus,
        userLoginStatus
      ];
}
