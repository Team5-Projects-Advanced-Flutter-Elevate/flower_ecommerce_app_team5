
sealed class PasswordState {}

class PasswordInitialState extends PasswordState {}

class PasswordLoadingState extends PasswordState {}

class PasswordErrorState extends PasswordState {
  final Object error;
  PasswordErrorState(this.error);
}

class PasswordSuccessState extends PasswordState {
  //final String message;
  PasswordSuccessState();
}
