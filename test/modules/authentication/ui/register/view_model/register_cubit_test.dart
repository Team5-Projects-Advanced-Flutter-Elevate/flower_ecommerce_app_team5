import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/register_request.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/register/register_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view_model/register_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view_model/register_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_cubit_test.mocks.dart';

@GenerateMocks([RegisterUseCase])
void main() {
  late MockRegisterUseCase mockRegisterUseCase;
  late RegisterCubit registerCubit;
  late Object exception;
  group('RegisterCubit', () {
    setUp(() {
      mockRegisterUseCase = MockRegisterUseCase();
      registerCubit = RegisterCubit(mockRegisterUseCase);
    });
    blocTest(
      'register success',
      build: () => registerCubit,
      setUp: () {
        provideDummy<ApiResult<AuthenticationResponseEntity>>(
          Success<AuthenticationResponseEntity>(
            data: AuthenticationResponseEntity(),
          ),
        );
        when(mockRegisterUseCase.execute(any)).thenAnswer(
          (_) async => Success<AuthenticationResponseEntity>(
            data: AuthenticationResponseEntity(),
          ),
        );
      },
      act: (cubit) => cubit.doIntent(OnSignUpClick(RegisterRequest())),
      expect: () => [
        const RegisterState(state: RegisterStatus.loading),
        const RegisterState(state: RegisterStatus.success),
      ],
    );

    blocTest(
      'register error',
      build: () => registerCubit,
      setUp: () {
        exception = Exception();
        provideDummy<ApiResult<AuthenticationResponseEntity>>(
          Error<AuthenticationResponseEntity>(
            error: exception,
          ),
        );
        when(mockRegisterUseCase.execute(any)).thenAnswer(
          (_) async => Error<AuthenticationResponseEntity>(
            error: exception,
          ),
        );
      },
      act: (cubit) => cubit.doIntent(OnSignUpClick(RegisterRequest())),
      expect: () => [
        const RegisterState(state: RegisterStatus.loading),
        RegisterState(state: RegisterStatus.error, error: exception),
      ],
    );
  });
}
