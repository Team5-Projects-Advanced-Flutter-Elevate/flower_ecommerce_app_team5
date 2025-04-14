import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/use_cases/best_seller/get_best_seller_products_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/view_model/best_seller_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/view_model/best_seller_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BestSellerViewModel extends Cubit<BestSellerState> {
  GetBestSellerProductsUseCase getBestSellerProductsUseCase;

  BestSellerViewModel(this.getBestSellerProductsUseCase)
      : super(BestSellerState());

  Future<void> doIntent(BestSellerIntent intent) {
    switch (intent) {
      case GetBestSellerProducts():
        return _getBestSellerProducts();
    }
  }

  Future<void> _getBestSellerProducts() async {
    emit(BestSellerState(bestSellerStatus: BestSellerStatus.loading));
    var useCaseResult = await getBestSellerProductsUseCase();
    switch (useCaseResult) {
      case Success<BestSellerResponseEntity>():
        emit(BestSellerState(
            bestSellerStatus: BestSellerStatus.success,
            bestSellerProducts: useCaseResult.data.bestSellerProducts));
      case Error<BestSellerResponseEntity>():
        emit(BestSellerState(
            bestSellerStatus: BestSellerStatus.error,
            error: useCaseResult.error));
    }
  }
}
