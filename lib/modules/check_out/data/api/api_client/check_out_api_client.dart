import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../models/address_model.dart';
import '../../models/address_response.dart';

part 'check_out_api_client.g.dart';

@RestApi()
abstract class CheckOutApiClient {
  factory CheckOutApiClient(Dio dio) = _CheckOutApiClient;

  @GET(ApisEndpoints.getAddresses)
  Future<AddressResponse> getAllAddresses();
}
