import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/register_request.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/authentication_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApisEndpoints.loginEndPoint)
  Future<void> login();

  @POST(ApisEndpoints.register)
  Future<AuthenticationResponse> register(@Body() RegisterRequest registerRequest);
}
