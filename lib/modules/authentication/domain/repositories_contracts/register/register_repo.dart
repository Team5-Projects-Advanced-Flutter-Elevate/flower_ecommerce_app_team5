import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import '../../../data/models/register/register_request.dart';

abstract interface class RegisterRepo {
  Future<ApiResult<AuthenticationResponseEntity>> register(
      RegisterRequest registerRequest);
}
