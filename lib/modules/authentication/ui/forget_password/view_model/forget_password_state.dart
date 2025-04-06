
sealed class PasswordState {}

class PasswordInitialState extends PasswordState {}

class PasswordLoadingState extends PasswordState {}

class PasswordErrorState extends PasswordState {
  final String error;
  PasswordErrorState(this.error);
}

class PasswordSuccessState extends PasswordState {
  final String message;
  PasswordSuccessState(this.message);
}
class EmailSuccessState extends PasswordState {
  final String message;
  EmailSuccessState(this.message);
}
