import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/api/api_client/auth_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/login/login_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';

import '../../../../../core/apis/api_result/api_result.dart';
import '../../models/login/login_input_model.dart';

class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
  final AuthApiClient _authApiClient;

  LoginRemoteDataSourceImp(this._authApiClient);
  @override
  Future<ApiResult<LoginResponseDto>> login(
      {required LoginInputModel loginInputModel}) async {
    return ApiExecutor.executeApi(() async {
      return await _authApiClient.login(loginInputModel);
    });
  }
}
