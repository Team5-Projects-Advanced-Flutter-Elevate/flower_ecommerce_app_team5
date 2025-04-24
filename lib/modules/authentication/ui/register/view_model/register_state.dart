import 'package:equatable/equatable.dart';
import '../../../domain/entities/authentication/authentication_response_entity.dart';

enum RegisterStatus {
  initial,
  loading,
  success,
  error,
}

extension RegisterStatusEx on RegisterState {
  bool get isInitial => state == RegisterStatus.initial;

  bool get isLoading => state == RegisterStatus.loading;

  bool get isSuccess => state == RegisterStatus.success;

  bool get isError => state == RegisterStatus.error;
}

enum RegisterFormStatus { valid, unValid }

extension RegisterFormStatusEx on RegisterState {
  bool get isValid => registerFormStatus == RegisterFormStatus.valid;

  bool get isUnValid => registerFormStatus == RegisterFormStatus.unValid;
}

class RegisterState extends Equatable {
  final RegisterStatus state;
  final RegisterFormStatus registerFormStatus;
  final AuthenticationResponseEntity? authEntity;
  final Object? error;

  const RegisterState({
    this.state = RegisterStatus.initial,
    this.authEntity,
    this.registerFormStatus = RegisterFormStatus.valid,
    this.error,
  });

  RegisterState copyWith({
    RegisterStatus? state,
    RegisterFormStatus? registerFormStatus,
    Object? error,
  }) {
    return RegisterState(
      state: state ?? this.state,
      error: error ?? this.error,
      registerFormStatus: registerFormStatus ?? this.registerFormStatus,
    );
  }

  @override
  List<Object?> get props => [
        state,
        error,
        registerFormStatus,
      ];
}
