import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_error/api_error_handler.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/login/login_use_case.dart';
import 'package:meta/meta.dart';

part 'login_view_model_state.dart';

class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  LoginViewModelCubit(this._loginUseCase) : super(LoginViewModelInitial());
  final LoginUseCase _loginUseCase;
  login(LoginInputModel loginInputModel) async {
    emit(LoginViewModelLoading());
    var result = await _loginUseCase.call(loginInputModel);
    switch (result.status) {
      case Success():
        emit(LoginViewModelSuccess());
      case Error():
        emit(LoginViewModelError(
            message: ApiErrorHandler.getInstance().handle(result.error)));
    }
  }
}
