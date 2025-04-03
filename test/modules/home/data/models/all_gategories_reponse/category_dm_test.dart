import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_gategories_reponse/category_dm.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Category model', () {
    test(
      'when call toEntity with non null values it should return CategoryEntity',
      () {
        // arrange
        var category = CategoryDM(
          id: 'id',
          slug: 'slug',
          createdAt: 'createdAt',
          updatedAt: 'updatedAt',
          image: 'r23r2',
          name: '12414',
          productsCount: 3,
        );
        // act
        var result = category.toEntity();
        // assert
        expect(result, isA<CategoryEntity>());
      },
    );

    test(
      'when call toEntity with  nullable values it should return nullable CategoryEntity',
      () {
        // arrange
        var category = CategoryDM();
        // act
        var result = category.toEntity();
        // assert
        expect(result, isA<CategoryEntity?>());
      },
    );
  });
}
