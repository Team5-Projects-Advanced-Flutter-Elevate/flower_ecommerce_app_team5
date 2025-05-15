import 'package:flower_ecommerce_app_team5/core/models/product/product_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/cart_item_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/cart_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_model_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('cart model ', () {
    test(
      'when call toEntity with non null values it should return CartModelEntity',
      () {
        // arrange
        var cart = Cart(
            id: 'id',
            user: 'user',
            discount: 1,
            totalPrice: 1,
            totalPriceAfterDiscount: 1,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            v: 1,
            cartItems: [
              CartItemModel(
                id: 'id',
                price: 1,
                quantity: 1,
                product: ProductDto(
                  id: 'id',
                  title: 'title',
                  description: 'description',
                  imgCover: 'imgCover',
                  priceAfterDiscount: 1,
                ),
              ),
            ]);
        // act
        var result = cart.toEntity();
        // ensure cart is not null
        var mappedResult = cart.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNotNull);
        });
        // assert
        expect(result, isA<CartModelEntity>());
      },
    );

    test(
      'when call toEntity with  nullable values it should return nullable  cartItemEntity',
      () {
        // arrange
        var cart = Cart();
        // act
        var result = cart.toEntity();
        // ensure cart is null
        var mappedResult = cart.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNull);
        });
        // assert
        expect(result, isA<CartModelEntity?>());
      },
    );
  });
}
