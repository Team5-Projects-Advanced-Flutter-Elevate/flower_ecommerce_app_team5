import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_entity.dart';

abstract interface class BestSellerRemoteDataSource {
  Future<ApiResult<BestSellerResponseEntity>> getBestSellerProducts();
}
