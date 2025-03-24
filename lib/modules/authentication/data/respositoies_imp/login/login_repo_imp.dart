import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/login/login_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/login/login_repo.dart';

class LoginRepoImp implements LoginRepo {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepoImp(this._loginRemoteDataSource);
  @override
  Future<ApiResult<LoginResponseDto>> login(
      {required LoginInputModel loginInputModel}) async {
    return await _loginRemoteDataSource.login(loginInputModel: loginInputModel);
  }
}
