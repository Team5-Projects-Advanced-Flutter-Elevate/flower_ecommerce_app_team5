import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';
import 'package:flower_ecommerce_app_team5/core/models/product/product_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('product model ', () {
    test(
      'when call toEntity with non null values it should return ProductEntity',
      () {
        // arrange
        var productModel = ProductDto(
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
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
          category: 'category',
          images: ['images'],
          slug: 'slug',
          v: 1,
        ); // act
        var result = productModel.convertIntoEntity();
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
        var productModel = ProductDto();
        // act
        var result = productModel.convertIntoEntity();
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
