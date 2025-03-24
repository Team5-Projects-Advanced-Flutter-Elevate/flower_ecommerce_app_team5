part of 'login_view_model_cubit.dart';

@immutable
sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}

final class LoginViewModelLoading extends LoginViewModelState {}

final class LoginViewModelSuccess extends LoginViewModelState {}

final class LoginViewModelError extends LoginViewModelState {
  final String message;
  LoginViewModelError({required this.message});
}
