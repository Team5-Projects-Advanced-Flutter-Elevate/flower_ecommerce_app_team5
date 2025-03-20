import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/api/api_client/auth_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthApiClientProvider {
  @singleton
  AuthApiClient provideApiClient(Dio dio) {
    return AuthApiClient(dio);
  }
}