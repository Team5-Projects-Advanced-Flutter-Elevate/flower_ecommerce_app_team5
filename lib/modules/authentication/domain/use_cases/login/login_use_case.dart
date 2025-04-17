import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/login/login_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/login/login_response_dto.dart';

@injectable
class LoginUseCase {
  final LoginRepo _loginRepo;
  LoginUseCase(this._loginRepo);
  Future<ApiResult<LoginResponseDto>> call(
          LoginInputModel loginInputModel, bool checkBoxValue) async =>
      await _loginRepo.login(
          loginInputModel: loginInputModel, checkBoxValue: checkBoxValue);
  Future<LoginResponseDto?> getStoredLoginInfo() =>
      _loginRepo.getStoredLoginInfo();
  Future<void> deleteLoginInfo() => _loginRepo.deleteLoginInfo();
  void cashUserData({required LoginResponseDto loginResponseDto}) =>
      _loginRepo.cashUser(loginResponseDto: loginResponseDto);
}
