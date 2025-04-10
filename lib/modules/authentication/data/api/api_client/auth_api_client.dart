import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import '../../models/forget_password/forget_password_response.dart';
part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient{
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApisEndpoints.loginEndPoint)
  Future<void> login();

  @POST(ApisEndpoints.forgetPasswordEndPoint)
  Future<ForgetPasswordResponse?> forgetPassword(
      @Body()Map<String, dynamic> body,
      );

  @PUT(ApisEndpoints.resetPasswordEndPoint)
  Future<ForgetPasswordResponse?> resetPassword(
      @Body()Map<String, dynamic> body,
      );

  @POST(ApisEndpoints.resetCodeEndPoint)
  Future<ForgetPasswordResponse?> resetCode(
      @Body()Map<String, dynamic> body,
      );
}