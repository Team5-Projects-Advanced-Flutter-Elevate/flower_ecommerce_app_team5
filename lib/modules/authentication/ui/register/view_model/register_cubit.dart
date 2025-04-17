import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/register/register_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view_model/register_state.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/register/register_request.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(const RegisterState());
  RegisterUseCase registerUseCase;

  void doIntent(RegisterIntent intent) {
    switch (intent) {
      case OnSignUpClick():
        _register(intent.registerRequest);
    }
  }

  Future<void> _register(RegisterRequest registerRequest) async {
    emit(state.copyWith(state: RegisterStatus.loading));
    var result = await registerUseCase.execute(registerRequest);
    switch (result) {
      case Success<AuthenticationResponseEntity>():
        emit(state.copyWith(state: RegisterStatus.success));
      case Error<AuthenticationResponseEntity>():
        emit(state.copyWith(
          state: RegisterStatus.error,
          error: result.error,
        ));
    }
  }
}

sealed class RegisterIntent {}

class OnSignUpClick extends RegisterIntent {
  RegisterRequest registerRequest;

  OnSignUpClick(this.registerRequest);
}
