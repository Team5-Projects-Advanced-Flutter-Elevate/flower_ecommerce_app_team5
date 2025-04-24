import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/core/constants/constants.dart';
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
    initialCategoryIndex = result ?? 0;
    if (categoriesList[initialCategoryIndex].id != selectedCategoryId) {
      selectedCategoryId = categoriesList[initialCategoryIndex].id;
    }
  }

  void _getCategories() async {
    categoriesList.clear();
    emit(CategoriesLayoutViewModelLoading());
    final result = await _getCategoriesUseCase.execute();
    switch (result) {
      case Success<List<CategoryEntity>?>():
        categoriesList = result.data ?? [];
        // Doing this insertion saved us a lot of work on managing what is the initialCategoryIndex will be
        categoriesList.insert(0, CategoryEntity(name: Constants.all, id: null));
        emit(CategoriesLayoutViewModelSuccess());
      case Error<List<CategoryEntity>?>():
        emit(CategoriesLayoutViewModelError(error: result.error));
    }
  }

  void _getAllProduct({String? categoryId, String? sortKey}) async {
    emit(CategoriesLayoutViewModelLoading());
    final result = await _getAllProductsUseCase.execute(
        categoryId: categoryId, sortKey: sortKey);
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

  void processIntent(CategoriesLayoutViewModelIntent intent) async {
    switch (intent) {
      case GetCategoriesIntent():
        _getCategories();
        break;
      case GetProductsIntent():
        _getAllProduct(categoryId: intent.categoryId, sortKey: intent.sortKey);
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
  final String? sortKey;
  GetProductsIntent({this.sortKey, this.categoryId});
}

final class TabBarChangedIntent extends CategoriesLayoutViewModelIntent {
  final String? categoryId;
  TabBarChangedIntent({this.categoryId});
}
