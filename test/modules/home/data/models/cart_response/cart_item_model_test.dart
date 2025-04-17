import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/cart_item_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/product_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_item_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('cart item model ', () {
    test(
      'when call toEntity with non null values it should return cartItemEntity',
      () {
        // arrange
        var cartItemModel = CartItemModel(
          product: Product(
            id: '1',
            title: 'title',
            description: 'description',
            imgCover: 'imgCover',
            priceAfterDiscount: 1,
          ),
          price: 1,
          quantity: 2,
          id: '1',

        );
        // act
        var result = cartItemModel.toEntity();
        // ensure cartItemModel is not null
        var mappedResult = cartItemModel.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNotNull);
        });
        // assert
        expect(result, isA<CartItemEntity>());
      },
    );

    test(
      'when call toEntity with  nullable values it should return nullable  cartItemEntity',
      () {
        // arrange
        var cartItemModel = CartItemModel();
        // act
        var result = cartItemModel.toEntity();
        // ensure cartItemModel is null
        var mappedResult = cartItemModel.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNull);
        });
        // assert
        expect(result, isA<CartItemEntity?>());
      },
    );
  });
}
