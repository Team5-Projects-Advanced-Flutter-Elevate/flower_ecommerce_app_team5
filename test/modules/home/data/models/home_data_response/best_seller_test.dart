import 'package:flower_ecommerce_app_team5/modules/home/data/models/home_data_response/best_seller.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/best_seller_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Best seller model', () {
    test(
      'when call toEntity with non null values it should return BestSellerEntity',
      () {
        // arrange
        var bestSeller = BestSellerDM(
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
        var result = bestSeller.toEntity();
        // ensure best seller is not null
        var mappedResult = bestSeller.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNotNull);
        });
        // assert
        expect(result, isA<BestSellerEntity>());
      },
    );

    test(
      'when call toEntity with  nullable values it should return nullable BestSellerEntity',
      () {
        // arrange
        var bestSeller = BestSellerDM();
        // act
        var result = bestSeller.toEntity();
        // ensure best seller null
        var mappedResult = bestSeller.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNull);
        });
        // assert
        expect(result, isA<BestSellerEntity?>());
      },
    );
  });
}
