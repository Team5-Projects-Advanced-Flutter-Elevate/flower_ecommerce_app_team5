import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_categories_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/apis/api_result/api_result.dart';
import '../../../../domain/entities/category_entity.dart';

part 'categories_layout_view_model_state.dart';

@injectable
class CategoriesLayoutViewModel extends Cubit<CategoriesLayoutViewModelState> {
  CategoriesLayoutViewModel(this._getCategoriesUseCase)
      : super(CategoriesLayoutViewModelInitial());
  final GetCategoriesUseCase _getCategoriesUseCase;
  List<CategoryEntity> categoriesList = [];

  void _getCategories() async {
    emit(CategoriesLayoutViewModelLoading());
    final result = await _getCategoriesUseCase.execute();
    switch (result) {
      case Success<List<CategoryEntity>?>():
        categoriesList = result.data!;
        emit(CategoriesLayoutViewModelSuccess());
      case Error<List<CategoryEntity>?>():
        emit(CategoriesLayoutViewModelError(error: result.error));
    }
  }

  void processIntent(CategoriesLayoutViewModelIntent intent) {
    switch (intent) {
      case GetCategoriesIntent():
        _getCategories();
        break;
    }
  }
}

sealed class CategoriesLayoutViewModelIntent {}

final class GetCategoriesIntent extends CategoriesLayoutViewModelIntent {}
