import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_all_products_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_categories_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCategoriesUseCase extends Mock implements GetCategoriesUseCase {}

class MockGetAllProductsUseCase extends Mock implements GetAllProductsUseCase {}

void main() {
  group('CategoriesLayoutViewModel test', () {
    late CategoriesLayoutViewModel categoriesViewModel;
    late MockGetCategoriesUseCase mockGetCategoriesUseCase;
    late MockGetAllProductsUseCase mockGetAllProductsUseCase;

    final categoriesList = [
      CategoryEntity(
          id: '1',
          name: 'name1',
          slug: 'slug1',
          image: 'image1',
          productsCount: 1),
      CategoryEntity(
          id: '2',
          name: 'name2',
          slug: 'slug2',
          image: 'image2',
          productsCount: 2),
      CategoryEntity(
          id: '3',
          name: 'name3',
          slug: 'slug3',
          image: 'image3',
          productsCount: 3),
    ];

    setUpAll(() {
      mockGetCategoriesUseCase = MockGetCategoriesUseCase();
      mockGetAllProductsUseCase = MockGetAllProductsUseCase();
      categoriesViewModel = CategoriesLayoutViewModel(
          mockGetCategoriesUseCase, mockGetAllProductsUseCase);

      // Setup mock response
      when(() => mockGetCategoriesUseCase.execute())
          .thenAnswer((_) async => Success(data: categoriesList));
    });

    blocTest<CategoriesLayoutViewModel, CategoriesLayoutViewModelState>(
      'when call processIntent with GetCategoriesIntent should emit loading then success and update categories list',
      build: () => categoriesViewModel,
      act: (bloc) => bloc.processIntent(GetCategoriesIntent()),
      expect: () => [
        CategoriesLayoutViewModelLoading(),
        CategoriesLayoutViewModelSuccess(),
      ],
      verify: (_) {
        // Verify the categories list was updated
        expect(categoriesViewModel.categoriesList, categoriesList);
        // Verify the method was called
        verify(() => mockGetCategoriesUseCase.execute()).called(1);
      },
    );
  });
}
