import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
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
      : super(const CategoriesLayoutViewModelState());
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;

  void processIntent(CategoriesLayoutViewModelIntent intent) async {
    switch (intent) {
      case GetCategoriesIntent():
        _getCategories();
      case GetProductsIntent():
        _getAllProduct(categoryId: intent.categoryId, sortKey: intent.sortKey);
      case SelectCategoryIntent():
        _getInitialCategoryIndex();
    }
  }

  String? selectedCategoryId;

  int initialCategoryIndex = 0;

  void _getInitialCategoryIndex() {
    for (int i = 0; i < state.categories.length; i++) {
      if (state.categories[i].id == selectedCategoryId) {
        initialCategoryIndex = i;
        _getAllProduct(categoryId: state.categories[i].id);
        break;
      }
    }
    if (state.categories[initialCategoryIndex].id != selectedCategoryId) {
      selectedCategoryId = state.categories[initialCategoryIndex].id;
    }
  }

  void _getCategories() async {
    emit(state.copyWith(
      getCategoriesStatus: Status.loading,
    ));
    var result = await _getCategoriesUseCase.execute();
    switch (result) {
      case Success<List<CategoryEntity>?>():
        emit(state.copyWith(
          getCategoriesStatus: Status.success,
          categories: result.data,
        ));
        _getInitialCategoryIndex();
      case Error<List<CategoryEntity>?>():
        emit(state.copyWith(
          getCategoriesStatus: Status.error,
          getCategoriesError: result.error,
        ));
    }
  }

  void _getAllProduct({String? categoryId, String? sortKey}) async {
    emit(state.copyWith(
      getProductsStatus: Status.loading,
    ));
    var result = await _getAllProductsUseCase.execute(
      categoryId: categoryId,
      sortKey: sortKey,
    );
    switch (result) {
      case Success<AllProductResponseEntity>():
        emit(state.copyWith(
          getProductsStatus: Status.success,
          products: result.data.products,
        ));
      case Error<AllProductResponseEntity>():
        emit(state.copyWith(
          getProductsStatus: Status.error,
          getProductsError: result.error,
        ));
    }
  }
}

sealed class CategoriesLayoutViewModelIntent {}

final class GetCategoriesIntent extends CategoriesLayoutViewModelIntent {}

final class GetProductsIntent extends CategoriesLayoutViewModelIntent {
  final String? categoryId;
  final String? sortKey;

  GetProductsIntent({this.sortKey, this.categoryId});
}

final class SelectCategoryIntent extends CategoriesLayoutViewModelIntent {}
