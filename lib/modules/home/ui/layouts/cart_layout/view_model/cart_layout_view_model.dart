import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/login/login_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/add_to_cart_request.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_item_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/add_to_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/delete_from_cart.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/update_cart_quantity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_state.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/apis/api_result/api_result.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  CartCubit(this.getCartItemsUseCase, this.loginUseCase, this.addToCartUseCase,
      this.deleteFromCartUseCase, this.updateCartQuantityUseCase)
      : super(CartState());

  GetCartItemsUseCase getCartItemsUseCase;
  LoginUseCase loginUseCase;
  AddToCartUseCase addToCartUseCase;
  DeleteFromCartUseCase deleteFromCartUseCase;
  UpdateCartQuantityUseCase updateCartQuantityUseCase;

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
        _deleteFromCart(
          intent.cartItemEntity,
          intent.count,
        );
      case UpdateCartQuantityIntent():
        _updateCartQuantity(
          intent.productId,
          {'quantity': intent.quantity},
        );
    }
  }

  void _updateCartQuantity(
      String productId, Map<String, dynamic> quantity) async {
    emit(state.copyWith(
      updateCartQuantityStatus: UpdateCartQuantityStatus.loading,
    ));
    var result = await updateCartQuantityUseCase.execute(productId, quantity);
    switch (result) {
      case Success<CartResponseEntity>():
        emit(state.copyWith(
          updateCartQuantityStatus: UpdateCartQuantityStatus.success,
          cartResponseEntity: result.data,
        ));
      case Error<CartResponseEntity>():
        emit(state.copyWith(
          updateCartQuantityStatus: UpdateCartQuantityStatus.error,
          error: result.error,
        ));
    }
  }

  void _increment(int price) {
    emit(state.copyWith(
      counterStatus: CounterStatus.increment,
      totalPrice: state.totalPrice + price,
    ));
  }

  void _decrement(int price) {
    emit(state.copyWith(
      counterStatus: CounterStatus.increment,
      totalPrice: state.totalPrice - price,
    ));
  }

  void _getCartItems() async {
    emit(state.copyWith(state: CartStatus.loading));
    var userData = await loginUseCase.getStoredLoginInfo();
    bool isLogin = userData != null;
    if (!isLogin) {
      emit(state.copyWith(
        state: CartStatus.noAccess,
        rebuildKey: state.rebuildKey + 1,
      ));
      return;
    }
    var result = await getCartItemsUseCase.execute();
    switch (result) {
      case Success<CartResponseEntity>():
        int totalPrice = _getTotalPrice(
          result.data.cartModelEntity!.cartItems!,
        ).toInt();
        emit(state.copyWith(
          state: CartStatus.success,
          cartResponseEntity: result.data,
          addToCartStatus: AddToCartStatus.initial,
          deleteFromCartStatus: DeleteFromCartStatus.initial,
          totalPrice: totalPrice != 0 ? totalPrice : state.totalPrice,
        ));
      case Error<CartResponseEntity>():
        emit(state.copyWith(
          state: CartStatus.error,
          error: result.error,
        ));
    }
  }

  num _getTotalPrice(List<CartItemEntity> cartItems) {
    num totalPrice = 0;
    for (var item in cartItems) {
      if (item.productEntity != null &&
          item.quantity != null &&
          item.productEntity!.priceAfterDiscount != null) {
        totalPrice +=
            (item.productEntity!.priceAfterDiscount! * item.quantity!);
      }
    }
    return totalPrice;
  }

  void _addToCart(AddToCartRequest request) async {
    emit(state.copyWith(
      addToCartStatus: AddToCartStatus.loading,
      addingProductId: request.product,
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

  void _deleteFromCart(CartItemEntity cartItemEntity, int count) async {
    emit(state.copyWith(
      deleteFromCartStatus: DeleteFromCartStatus.loading,
      totalPrice: state.totalPrice -
          (cartItemEntity.productEntity!.priceAfterDiscount!.toInt() * count),
    ));
    var result = await deleteFromCartUseCase.execute(
      cartItemEntity.productEntity!.id!,
    );
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
  final CartItemEntity cartItemEntity;
  final int count;

  DeleteFromCartIntent({
    required this.cartItemEntity,
    required this.count,
  });
}

class UpdateCartQuantityIntent extends CartIntent {
  final String productId;
  final int quantity;

  UpdateCartQuantityIntent({
    required this.productId,
    required this.quantity,
  });
}
