import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/product_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('product model ', () {
    test(
      'when call toEntity with non null values it should return ProductEntity',
      () {
        // arrange
        var productModel = Product(
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
          price: 1,
          occasion: 'occasion',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          category: 'category',
          images: ['images'],
          slug: 'slug',
          v: 1,
        ); // act
        var result = productModel.toEntity();
        // ensure productModel is not null
        var mappedResult = productModel.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNotNull);
        });
        // assert
        expect(result, isA<ProductEntity>());
      },
    );

    test(
      'when call toEntity with  nullable values it should return nullable  cartItemEntity',
      () {
        // arrange
        var productModel = Product();
        // act
        var result = productModel.toEntity();
        // ensure productModel is null
        var mappedResult = productModel.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNull);
        });
        // assert
        expect(result, isA<ProductEntity?>());
      },
    );
  });
}
