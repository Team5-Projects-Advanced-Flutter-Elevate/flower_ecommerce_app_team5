
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/forget_password/forget_password_response.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/forget_password/reset_password_repo.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/reset_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reset_code_use_case_test.mocks.dart';
import 'reset_password_use_case_test.mocks.dart';

@GenerateMocks([ResetPasswordRepo])
void main() {
  group("useCase Test",() {
    late ResetPasswordUseCase useCase;
    late ResetPasswordRepo repo;
    setUp(() {
      repo = MockResetPasswordRepo();
      useCase = ResetPasswordUseCase(repo);
    },);
    test('when call method call it should '
        'call resetCode from repo', () async {
      var result = Success<ForgetPasswordResponse?>(data: ForgetPasswordResponse());

      provideDummy<ApiResult<ForgetPasswordResponse?>>(result);

      when(repo.resetPassword("muhamadbishta@gmail.com", "Mohamed@1234")).thenAnswer((realInvocation) async{
        return result;
      },);

      var actual = await useCase.call("muhamadbishta@gmail.com", "Mohamed@1234");

      verify(repo.resetPassword("muhamadbishta@gmail.com", "Mohamed@1234")).called(1);

      expect(actual, equals(result));
    });
  },);
}