import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/api/api_client/auth_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/login/login_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/apis/api_result/api_result.dart';
import '../../../../../core/utilities/dio/dio_service/dio_service.dart';
import '../../models/login/login_input_model.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
  final AuthApiClient _authApiClient;
  LoginRemoteDataSourceImp(this._authApiClient);
  @override
  Future<ApiResult<LoginResponseDto>> login(
      {required LoginInputModel loginInputModel}) async {
    var result = await ApiExecutor.executeApi(
        () async => await _authApiClient.login(loginInputModel));
    switch (result) {
      case Success<LoginResponseDto>():
        DioServiceExtension.updateDioWithToken(result.data.token!);
        return Success(data: result.data);
      case Error<LoginResponseDto>():
        return Error(error: result.error);
    }
  }
}
