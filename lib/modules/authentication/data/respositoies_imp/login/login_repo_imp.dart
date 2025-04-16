import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/login/login_local_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/login/login_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/login/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImp implements LoginRepo {
  final LoginRemoteDataSource _loginRemoteDataSource;
  final LoginLocalDataSource _loginLocalDataSource;

  LoginRepoImp(this._loginRemoteDataSource, this._loginLocalDataSource);
  @override
  Future<ApiResult<LoginResponseDto>> login(
      {required LoginInputModel loginInputModel,
      required bool checkBoxValue}) async {
    var result =
        await _loginRemoteDataSource.login(loginInputModel: loginInputModel);
    switch (result) {
      case Success<LoginResponseDto>():
        if (checkBoxValue) {
          _loginLocalDataSource.cashUser(loginResponseDto: result.data);
        }
        return Success(data: result.data);
      case Error<LoginResponseDto>():
        return Error(error: result.error);
    }
  }

  @override
  Future<void> deleteLoginInfo() {
    return _loginLocalDataSource.deleteCachedUser();
  }

  @override
  Future<LoginResponseDto?> getStoredLoginInfo() {
    return _loginLocalDataSource.getCashedUser();
  }

  cashUser({required LoginResponseDto loginResponseDto}) {
    _loginLocalDataSource.cashUser(loginResponseDto: loginResponseDto);
  }
}
