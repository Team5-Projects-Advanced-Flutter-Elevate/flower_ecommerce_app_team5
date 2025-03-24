import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';

import '../../models/login/login_input_model.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResult<LoginResponseDto>> login(
      {required LoginInputModel loginInputModel});
}
