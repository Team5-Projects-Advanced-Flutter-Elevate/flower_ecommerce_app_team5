import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/forget_password/forget_password_response.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/forget_password/reset_code_repo.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/reset_code_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reset_code_use_case_test.mocks.dart';

@GenerateMocks([ResetCodeRepo])
void main() {
  group("useCase Test",() {
    late ResetCodeUseCase useCase;
    late ResetCodeRepo repo;
    setUp(() {
      repo = MockResetCodeRepo();
      useCase = ResetCodeUseCase(repo);
    },);
    test('when call method call it should '
        'call resetCode from repo', () async {
      var result = Success<ForgetPasswordResponse?>(data: ForgetPasswordResponse());

      provideDummy<ApiResult<ForgetPasswordResponse?>>(result);

      when(repo.resetCode(result.data?.info??"")).thenAnswer((realInvocation) async{
        return result;
      },);

      var actual = await useCase.call(result.data?.info??"");

      verify(repo.resetCode(result.data?.info??"")).called(1);

      expect(actual, equals(result));
    });
  },);
}