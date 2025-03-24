import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/login/login_repo.dart';

class LoginUseCase {
  final LoginRepo _loginRepo;
  LoginUseCase(this._loginRepo);
  call(LoginInputModel loginInputModel) =>
      _loginRepo.login(loginInputModel: loginInputModel);
}
