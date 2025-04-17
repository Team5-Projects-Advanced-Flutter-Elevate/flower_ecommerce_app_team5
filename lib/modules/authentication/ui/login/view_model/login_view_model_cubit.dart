import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/login/login_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utilities/dio/dio_service/dio_service.dart';
import '../../../domain/use_cases/login_as_guest/login_as_gust_use_case.dart';

part 'login_view_model_state.dart';

@injectable
class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  LoginViewModelCubit(this._loginUseCase, this.loginAsGuestUseCase)
      : super(const LoginViewModelInitial());
  final LoginUseCase _loginUseCase;
  LoginAsGuestUseCase loginAsGuestUseCase;

  bool checkBoxValue = false;
  bool obscurePassword = true;
  _login(LoginInputModel loginInputModel) async {
    _loginUseCase.deleteLoginInfo();
    emit(const LoginViewModelLoading());
    var result = await _loginUseCase.call(loginInputModel, checkBoxValue);
    switch (result) {
      case Success():
        DioServiceExtension.updateDioWithToken(result.data.token!);
        emit(LoginViewModelSuccess(result.data));
      case Error():
        emit(LoginViewModelError(error: result.error));
    }
  }

  _rememberMe() {
    checkBoxValue = !checkBoxValue;
    emit(LoginViewModelRememberMe(checkBoxValue));
  }

  _showPassword() {
    obscurePassword = !obscurePassword;
    emit(LoginViewModelShowPassword(obscurePassword));
  }

  Future<void> _handleLoginGuest() async {
    try {
      emit(const LoginViewModelLoading());
      // var guestLogin = await loginAsGuestUseCase.isGuest();
      emit(IsGuestSuccess());
    } on Exception catch (e) {
      emit(LoginViewModelError(error: e));
    }
  }

  void processIntent(LoginViewModelIntent intent) {
    switch (intent) {
      case ShowPasswordIntent():
        _showPassword();
        break;
      case RememberMeIntent():
        _rememberMe();
        break;
      case LoginIntent():
        _login(intent.loginInputModel);
        break;
      case LoginAsGuestIntent():
        _handleLoginGuest();
        break;
    }
  }
}

sealed class LoginViewModelIntent {}

final class ShowPasswordIntent extends LoginViewModelIntent {}

final class RememberMeIntent extends LoginViewModelIntent {}

final class LoginIntent extends LoginViewModelIntent {
  final LoginInputModel loginInputModel;
  LoginIntent({required this.loginInputModel});
}

class LoginAsGuestIntent extends LoginViewModelIntent {}
