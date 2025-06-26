import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';
import 'package:flower_ecommerce_app_team5/core/models/product/product_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Best seller model', () {
    test(
      'when call toEntity with non null values it should return BestSellerEntity',
      () {
        // arrange
        var bestSeller = ProductDto(
          id: 'id',
          title: 'title',
          slug: 'slug',
          description: 'description',
          imgCover: 'imgCover',
          images: ['images'],
          price: 1,
          priceAfterDiscount: 1,
          quantity: 1,
          discount: 1,
          sold: 1,
          rateAvg: 1,
          rateCount: 1,
          occasion: '12',
          createdAt: 'createdAt',
          updatedAt: 'updatedAt',
          category: '123123',
          v: 3,
        );
        // act
        var result = bestSeller.convertIntoEntity();
        // ensure best seller is not null
        var mappedResult = bestSeller.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNotNull);
        });
        // assert
        expect(result, isA<ProductEntity>());
      },
    );

    test(
      'when call toEntity with  nullable values it should return nullable BestSellerEntity',
      () {
        // arrange
        var bestSeller = ProductDto();
        // act
        var result = bestSeller.convertIntoEntity();
        // ensure best seller null
        var mappedResult = bestSeller.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNull);
        });
        // assert
        expect(result, isA<ProductEntity?>());
      },
    );
  });
}
