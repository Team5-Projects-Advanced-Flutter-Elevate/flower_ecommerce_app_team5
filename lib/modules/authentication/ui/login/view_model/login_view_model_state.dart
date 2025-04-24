part of 'login_view_model_cubit.dart';

@immutable
sealed class LoginViewModelState extends Equatable {
  const LoginViewModelState();

  @override
  List<Object?> get props => [];
}

final class LoginViewModelInitial extends LoginViewModelState {
  const LoginViewModelInitial();

  @override
  List<Object?> get props => [];
}

final class LoginViewModelLoading extends LoginViewModelState {
  const LoginViewModelLoading();

  @override
  List<Object?> get props => [];
}

final class LoginViewModelSuccess extends LoginViewModelState {
  final LoginResponseDto? loginResponse;
  const LoginViewModelSuccess(this.loginResponse);

  @override
  List<Object?> get props => [loginResponse];
}

final class LoginViewModelRememberMe extends LoginViewModelState {
  final bool value;
  const LoginViewModelRememberMe(this.value);

  @override
  List<Object?> get props => [value]; // Include value in comparison
}

final class LoginViewModelShowPassword extends LoginViewModelState {
  final bool obscure; // Track password visibility
  const LoginViewModelShowPassword(this.obscure);

  @override
  List<Object?> get props => [obscure]; // Include obscure in comparison
}

final class LoginViewModelError extends LoginViewModelState {
  final Object error;
  const LoginViewModelError({required this.error});

  @override
  List<Object?> get props => [error]; // Include error in comparison
}
class IsGuestSuccess extends LoginViewModelState {}
