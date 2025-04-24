import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/repositories_contracts/best_seller/best_seller_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBestSellerProductsUseCase {
  BestSellerRepository bestSellerRepository;

  GetBestSellerProductsUseCase(this.bestSellerRepository);

  Future<ApiResult<BestSellerResponseEntity>> call() {
    return bestSellerRepository.getBestSellerProducts();
  }
}
