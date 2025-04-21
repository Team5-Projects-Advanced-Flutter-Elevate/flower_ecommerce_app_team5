import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../core/apis/api_result/api_result.dart';
import '../../home/domain/entities/all_product_response_entity.dart';
import '../../home/domain/entities/product_entity.dart';
import '../../home/domain/use_cases/get_all_products_use_case.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._getAllProductsUseCase) : super(SearchInitial());
  final GetAllProductsUseCase _getAllProductsUseCase;
  void search({
    String? searchKey,
  }) async {
    if (searchKey!.isEmpty) return;
    emit(SearchLoading());
    final result = await _getAllProductsUseCase.execute(searchKey: searchKey);
    switch (result) {
      case Success<AllProductResponseEntity>():
        emit(SearchSuccess(
            productsList: result.data.products as List<ProductEntity> ?? []));
        break;
      case Error<AllProductResponseEntity>():
        emit(SearchError(error: result.error));
        break;
    }
  }
}
