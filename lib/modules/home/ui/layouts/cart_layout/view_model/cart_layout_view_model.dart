import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/login/login_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/apis/api_result/api_result.dart';
import '../../../../../../core/utilities/dio/dio_service/dio_service.dart';
import '../../../../domain/entities/cart_response_entity/cart_item_entity.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this.getCartItemsUseCase,
    this.loginUseCase,
  ) : super(const CartState());
  GetCartItemsUseCase getCartItemsUseCase;
  LoginUseCase loginUseCase;

  void doIntent(CartIntent intent) {
    switch (intent) {
      case GetCartItemsIntent():
        _getCartItems();
    }
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
        emit(
          state.copyWith(
            state: CartStatus.success,
            cartResponseEntity: result.data,
          ),
        );
      case Error<CartResponseEntity>():
        emit(state.copyWith(
          state: CartStatus.error,
          error: result.error,
        ));
    }
  }
}

sealed class CartIntent {}

class GetCartItemsIntent extends CartIntent {}
