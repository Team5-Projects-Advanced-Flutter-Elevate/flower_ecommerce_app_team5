import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/new_address_response/new_address_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'update_address_api_client.g.dart';
@RestApi()
abstract class UpdateAddressApiClient{
  factory UpdateAddressApiClient(Dio dio) = _UpdateAddressApiClient;


  @PATCH(ApisEndpoints.updateAddress)
  Future<SaveAddressResponse> updateAddress(@Path() String id,@Body() Map<String,dynamic> body);
}