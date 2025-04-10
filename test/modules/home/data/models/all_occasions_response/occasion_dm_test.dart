import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_occasions_response/occasion_dm.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Occasion model', () {


    test(
      'when call toEntity with non null values it should return OccasionEntity',
      () {
        // arrange
        var occasion = OccasionDM(
          id: 'id',
          slug: 'slug',
          createdAt: 'createdAt',
          updatedAt: 'updatedAt',
          name: 'adasd',
          image: '12312',
          productsCount: 2,
        );
        // act
        var result = occasion.toEntity();
        // ensure category is not null
        var mappedResult = occasion.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNotNull);
        });
        // assert
        expect(result, isA<OccasionEntity>());
      },
    );

    test(
      'when call toEntity with  nullable values it should return nullable OccasionEntity',
      () {
        // arrange
        var occasion = OccasionDM();
        // act
        var result = occasion.toEntity();
        // ensure category is null
        var mappedResult = occasion.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNull);
        });
        // assert
        expect(result, isA<OccasionEntity?>());
      },
    );
  });
}
