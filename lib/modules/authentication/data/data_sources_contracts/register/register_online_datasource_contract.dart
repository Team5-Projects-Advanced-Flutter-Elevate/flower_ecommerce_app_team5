import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';

import '../../../domain/entities/authentication/authentication_response_entity.dart';
import '../../models/register/register_request.dart';

abstract interface class RegisterOnlineDataSource {
  Future<ApiResult<AuthenticationResponseEntity>> register(
      RegisterRequest registerRequest);
}
