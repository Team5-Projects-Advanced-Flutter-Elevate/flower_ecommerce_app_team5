import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_gategories_reponse/all_categories_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_occasions_response/all_occasions_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';

part 'home_api_client.g.dart';

@RestApi(baseUrl: ApisEndpoints.baseUrl)
abstract class HomeApiClient {
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(ApisEndpoints.getCategories)
  Future<AllCategoriesResponse> getCategories();

  @GET(ApisEndpoints.getOccasions)
  Future<AllOccasionsResponse> getOccasions();
}
