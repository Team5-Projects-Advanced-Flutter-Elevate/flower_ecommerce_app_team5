import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/cart_item_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/cart_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/cart_response_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/product_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('cart response ', () {
    test(
      'when call toEntity with non null values it should return CartResponseEntity',
      () {
        // arrange
        var cartResponse = CartResponse(
          message: 'message',
          numOfCartItems: 1,
          cart: Cart(
            id: 'id',
            user: 'user',
            discount: 1,
            totalPrice: 1,
            totalPriceAfterDiscount: 1,
            cartItems: [
              CartItemModel(
                id: 'id',
                price: 1,
                quantity: 1,
                product: Product(
                  id: 'id',
                  title: 'title',
                  description: 'description',
                  imgCover: 'imgCover',
                  priceAfterDiscount: 1,
                  quantity: 1,
                  discount: 1,
                  sold: 1,
                  rateAvg: 1,
                  rateCount: 1,
                  category: 'category',
                  slug: 'slug',
                  occasion: 'occasion',
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                  v: 1,
                  images: ['images'],
                  price: 1,
                ),
              ),
            ],
          ),

        );
        // act
        var result = cartResponse.toEntity();
        // ensure cartResponse is not null
        var mappedResult = cartResponse.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNotNull);
        });
        // assert
        expect(result, isA<CartResponseEntity>());
      },
    );

    test(
      'when call toEntity with  nullable values it should return nullable  CartResponseEntity',
      () {
        // arrange
        var cartResponse = CartResponse();
        // act
        var result = cartResponse.toEntity();
        // ensure cartResponse is null
        var mappedResult = cartResponse.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNull);
        });
        // assert
        expect(result, isA<CartResponseEntity?>());
      },
    );
  });
}
