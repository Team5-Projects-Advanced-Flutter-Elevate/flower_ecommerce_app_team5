import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/data/models/get_occasion.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';

import '../../../../home/data/models/all_products_response/all_product_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApisEndpoints.baseUrl)
abstract class OccasionApiClient {
  factory OccasionApiClient(Dio dio) = _OccasionApiClient;

  @GET(ApisEndpoints.occasion)
  Future<GetOccasionDTO> getOccasionData();
  @GET(ApisEndpoints.getProducts)
  Future<AllProductResponse> getAllProductForOccasion();
}
