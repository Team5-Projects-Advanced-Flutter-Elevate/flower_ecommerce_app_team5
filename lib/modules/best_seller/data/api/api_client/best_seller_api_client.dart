import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/models/best_seller_response/best_seller_response_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'best_seller_api_client.g.dart';

@RestApi()
abstract class BestSellerApiClient{
  factory BestSellerApiClient(Dio dio)= _BestSellerApiClient;

  @GET(ApisEndpoints.bestSellerEndpoint)
  Future<BestSellerResponseDto> getBestSellerProducts();

}