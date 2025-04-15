import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_products_response/all_product_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_categories_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/apis/api_result/api_result.dart';
import '../../../../domain/entities/category_entity.dart';
import '../../../../domain/use_cases/get_all_products_use_case.dart';

part 'categories_layout_view_model_state.dart';

@injectable
class CategoriesLayoutViewModel extends Cubit<CategoriesLayoutViewModelState> {
  CategoriesLayoutViewModel(
      this._getCategoriesUseCase, this._getAllProductsUseCase)
      : super(CategoriesLayoutViewModelInitial());
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  List<CategoryEntity> categoriesList = [];
  List<ProductEntity> productsList = [];
  String? selectedCategoryId;
  int initialCategoryIndex = 0;
  void _tabChange(String? categoryId) {
    print("Coming category Id: $categoryId");
    print("selected category Id: $selectedCategoryId");
    print(categoryId == selectedCategoryId);

    if (categoryId == selectedCategoryId) return;

    selectedCategoryId = categoryId;
    _getAllProduct(categoryId: selectedCategoryId);
  }

  void _getInitialCategoryIndex() {
    int? result;
    for (int i = 0; i < categoriesList.length; i++) {
      if (categoriesList[i].id == selectedCategoryId) {
        result = i;
        break;
      }
    }
    if (result == 0) {
      initialCategoryIndex = 1;
    } else {
      initialCategoryIndex = result != null ? result + 1 : 0;
    }
    print("Initial category index $initialCategoryIndex");
  }

  Future<void> _getCategories() async {
    categoriesList.clear();
    emit(CategoriesLayoutViewModelLoading());
    final result = await _getCategoriesUseCase.execute();
    switch (result) {
      case Success<List<CategoryEntity>?>():
        categoriesList = result.data ?? [];
        emit(CategoriesLayoutViewModelSuccess());
      case Error<List<CategoryEntity>?>():
        emit(CategoriesLayoutViewModelError(error: result.error));
    }
  }

  Future<void> _getAllProduct({String? categoryId}) async {
    print("category Id for getting products: $categoryId");

    emit(CategoriesLayoutViewModelLoading());
    final result = await _getAllProductsUseCase.execute(categoryId: categoryId);
    switch (result) {
      case Success<AllProductResponseEntity>():
        productsList = result.data.products ?? [];
        emit(CategoriesViewModelTabBarChanged());
        break;
      case Error<AllProductResponseEntity>():
        emit(CategoriesLayoutViewModelError(error: result.error));
        break;
    }
  }

  Future<void> processIntent(CategoriesLayoutViewModelIntent intent) async {
    switch (intent) {
      case GetCategoriesIntent():
        await _getCategories();
        break;
      case GetProductsIntent():
        await _getAllProduct(categoryId: intent.categoryId);
        break;
      case TabBarChangedIntent():
        _tabChange(intent.categoryId);
        break;
      case GetInitialCategoryIndex():
        _getInitialCategoryIndex();
        break;
    }
  }
}

sealed class CategoriesLayoutViewModelIntent {}

final class GetCategoriesIntent extends CategoriesLayoutViewModelIntent {}

final class GetInitialCategoryIndex extends CategoriesLayoutViewModelIntent {}

final class GetProductsIntent extends CategoriesLayoutViewModelIntent {
  final String? categoryId;
  GetProductsIntent({this.categoryId});
}

final class TabBarChangedIntent extends CategoriesLayoutViewModelIntent {
  final String? categoryId;
  TabBarChangedIntent({this.categoryId});
}
