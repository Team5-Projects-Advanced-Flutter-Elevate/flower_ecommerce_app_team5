import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use_cases/login_as_guest/login_as_gust_use_case.dart';
import 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<loginAuth> {
  LoginAsGuest loginAsGuest;
  LoginViewModel(this.loginAsGuest) : super(LoginInitial());

  void onIntent(LoginAuth intent) {
    switch (intent) {
      case LoginAsGuestIntent():
        _handleLoginGuest();
        break;
    }
  }

  Future<void> _handleLoginGuest() async {
    try {
      emit(LoginLoading());
      var GuestLogin = await loginAsGuest.isGuest();
      emit(IsGuestSuccess());
    } on Exception catch (e) {
      emit(LoginFailure('$e'));
    }
  }
}

sealed class LoginAuth {}

class LoginAsGuestIntent extends LoginAuth {}
