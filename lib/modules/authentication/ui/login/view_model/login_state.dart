sealed class loginAuth {}

class LoginInitial extends loginAuth {}

class LoginLoading extends loginAuth {}

class LoginSuccess extends loginAuth {}

class LoginFailure extends loginAuth {
  final String error;
  LoginFailure(this.error);
}

class IsGuestSuccess extends loginAuth {}
