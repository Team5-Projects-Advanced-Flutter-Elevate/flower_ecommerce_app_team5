import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/dio/dio_service/dio_service.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/login/login_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/add_to_cart_request.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/add_to_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/delete_from_cart.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/apis/api_result/api_result.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this.getCartItemsUseCase,
    this.loginUseCase,
    this.addToCartUseCase,
    this.deleteFromCartUseCase,
  ) : super(CartState());

  GetCartItemsUseCase getCartItemsUseCase;
  LoginUseCase loginUseCase;
  AddToCartUseCase addToCartUseCase;
  DeleteFromCartUseCase deleteFromCartUseCase;

  void doIntent(CartIntent intent) {
    switch (intent) {
      case GetCartItemsIntent():
        _getCartItems();
      case IncrementIntent():
        _increment(intent.price);
      case DecrementIntent():
        _decrement(intent.price);
      case AddToCartIntent():
        _addToCart(intent.request);
      case DeleteFromCartIntent():
        _deleteFromCart(intent.id);
    }
  }

  void _increment(int price) {
    emit(state.copyWith(
      counterStatus: CounterStatus.increment,
      totalPrice: state.totalPrice + price,
    ));
    log(state.totalPrice.toString());
  }

  void _decrement(int price) {
    emit(state.copyWith(
      counterStatus: CounterStatus.increment,
      totalPrice: state.totalPrice - price,
    ));
  }

  void _getCartItems() async {
    var userData = await loginUseCase.getStoredLoginInfo();
    bool isLogin = userData != null;
    if (!isLogin) {
      emit(state.copyWith(
        state: CartStatus.noAccess,
      ));
      return;
    }

    emit(state.copyWith(state: CartStatus.loading));
    var result = await getCartItemsUseCase.execute();
    switch (result) {
      case Success<CartResponseEntity>():
        state.totalPrice =
            result.data.cartModelEntity?.totalPriceAfterDiscount?.toInt() ?? 0;
        emit(
          state.copyWith(
            state: CartStatus.success,
            cartResponseEntity: result.data,
            addToCartStatus: AddToCartStatus.initial,
            deleteFromCartStatus: DeleteFromCartStatus.initial,
          ),
        );
      case Error<CartResponseEntity>():
        emit(state.copyWith(
          state: CartStatus.error,
          error: result.error,
        ));
    }
  }

  void _addToCart(AddToCartRequest request) async {
    emit(state.copyWith(
      addToCartStatus: AddToCartStatus.loading,
    ));
    var userData = await loginUseCase.getStoredLoginInfo();
    bool isLogin = userData != null;
    if (!isLogin) {
      emit(state.copyWith(
        addToCartStatus: AddToCartStatus.noAccess,
      ));
      return;
    }

    var result = await addToCartUseCase.execute(request);
    switch (result) {
      case Success<CartResponseEntity>():
        emit(state.copyWith(
          addToCartStatus: AddToCartStatus.success,
        ));
      case Error<CartResponseEntity>():
        emit(
          state.copyWith(
            addToCartStatus: AddToCartStatus.error,
            error: result.error,
          ),
        );
    }
  }

  void _deleteFromCart(String id) async {
    emit(state.copyWith(
      deleteFromCartStatus: DeleteFromCartStatus.loading,
    ));
    var result = await deleteFromCartUseCase.execute(id);
    switch (result) {
      case Success<CartResponseEntity>():
        emit(state.copyWith(
          deleteFromCartStatus: DeleteFromCartStatus.success,
          cartResponseEntity: result.data,
        ));
      case Error<CartResponseEntity>():
        emit(
          state.copyWith(
            deleteFromCartStatus: DeleteFromCartStatus.error,
            error: result.error,
          ),
        );
    }
  }
}

sealed class CartIntent {}

class GetCartItemsIntent extends CartIntent {}

class IncrementIntent extends CartIntent {
  final int price;

  IncrementIntent({required this.price});
}

class DecrementIntent extends CartIntent {
  final int price;

  DecrementIntent({required this.price});
}

class AddToCartIntent extends CartIntent {
  final AddToCartRequest request;

  AddToCartIntent({required this.request});
}

class DeleteFromCartIntent extends CartIntent {
  final String id;

  DeleteFromCartIntent({required this.id});
}
