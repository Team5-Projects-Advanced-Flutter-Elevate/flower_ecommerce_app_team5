import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';


part 'profile_api_client.g.dart';

@RestApi(baseUrl: ApisEndpoints.baseUrl)
abstract class ProfileApiClient {
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;


}
