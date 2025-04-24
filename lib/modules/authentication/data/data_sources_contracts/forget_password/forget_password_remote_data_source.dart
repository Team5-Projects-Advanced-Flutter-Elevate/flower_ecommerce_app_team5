import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';

import '../../models/forget_password/forget_password_response.dart';

abstract class ForgetPasswordRemoteDataSource{
  Future<ApiResult<ForgetPasswordResponse?>>forgetPassword(String email);
}