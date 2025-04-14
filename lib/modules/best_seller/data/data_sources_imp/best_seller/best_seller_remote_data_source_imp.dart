import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/api/api_client/best_seller_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/data_sources_contract/best_seller/best_seller_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/models/best_seller_response/best_seller_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BestSellerRemoteDataSource)
class BestSellerRemoteDataSourceImp implements BestSellerRemoteDataSource {
  BestSellerApiClient bestSellerApiClient;

  BestSellerRemoteDataSourceImp(this.bestSellerApiClient);

  @override
  Future<ApiResult<BestSellerResponseEntity>> getBestSellerProducts() async {
    var apiResult = await ApiExecutor.executeApi<BestSellerResponseDto>(
      () async {
        return bestSellerApiClient.getBestSellerProducts();
      },
    );
    switch (apiResult) {
      case Success<BestSellerResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<BestSellerResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
