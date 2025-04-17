import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/data_sources_contract/best_seller/best_seller_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/repositories_contracts/best_seller/best_seller_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BestSellerRepository)
class BestSellerRepositoryImp implements BestSellerRepository {
  BestSellerRemoteDataSource bestSellerRemoteDataSource;
  BestSellerRepositoryImp(this.bestSellerRemoteDataSource);
  @override
  Future<ApiResult<BestSellerResponseEntity>> getBestSellerProducts() {
    return bestSellerRemoteDataSource.getBestSellerProducts();
  }
}
