import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/forget_password_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/reset_code_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/reset_password_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view_model/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ForgetPasswordViewModel extends Cubit<PasswordState>{
  ForgetPasswordUseCase forgetPasswordUseCase;
  ResetPasswordUseCase resetPasswordUseCase;
  ResetCodeUseCase resetCodeUseCase;
  @factoryMethod
  ForgetPasswordViewModel(this.forgetPasswordUseCase,this.resetPasswordUseCase,this.resetCodeUseCase):super(PasswordInitialState());
  void onIntent(ForgetIntent intent) {
    switch (intent) {
      case ForgotPasswordIntent() : _forgetPasswordHandling(intent.email);
      break;
      case ResetPasswordIntent() : _resetPasswordHandling(intent.email, intent.newPassword);
      break;
      case ResetCodeIntent() : _resetCodeHandling(intent.code);
      break;
    }
  }
  _forgetPasswordHandling(String email) async {
    emit(PasswordLoadingState());
       var result = await forgetPasswordUseCase.call(email);
       if( result is Success){
         emit(PasswordSuccessState(result.toString()));
       }else{
         emit(PasswordErrorState(result.toString()));
       }
  }
  _resetPasswordHandling(String email,String newPassword) async {
    emit(PasswordLoadingState());
    var result = await resetPasswordUseCase.call(email,newPassword);
    if( result is Success){
      emit(PasswordSuccessState(result.toString()));
    }else{
      emit(PasswordErrorState(result.toString()));
    }
  }
  _resetCodeHandling(String code) async {
    emit(PasswordLoadingState());
    var result = await resetCodeUseCase.call(code);
    if( result is Success){
      emit(PasswordSuccessState(result.toString()));
    }else{
      emit(PasswordErrorState(result.toString()));
    }
  }
}

sealed class ForgetIntent {}
class ForgotPasswordIntent extends ForgetIntent {
  final String email;
  ForgotPasswordIntent(this.email);
}

class ResetPasswordIntent extends ForgetIntent {
  final String email;
  final String newPassword;
  ResetPasswordIntent(this.email,this.newPassword);
}

class ResetCodeIntent extends ForgetIntent {
  final String code;
  ResetCodeIntent(this.code);
}
