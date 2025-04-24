import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/forget_password/forget_password_response.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/forget_password/forget_password_repo.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/forget_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([ForgetPasswordRepo])
void main() {
  group("useCase Test",() {
    late ForgetPasswordUseCase useCase;
    late ForgetPasswordRepo repo;
    setUp(() {
      repo = MockForgetPasswordRepo();
      useCase = ForgetPasswordUseCase(repo);
    },);
    test('when call method call it should '
        'call forgetPassword from repo', () async {
      var result = Success<ForgetPasswordResponse?>(data: ForgetPasswordResponse());

      provideDummy<ApiResult<ForgetPasswordResponse?>>(result);

      when(repo.forgetPassword("muhamadbishta@gmail.com")).thenAnswer((realInvocation) async{
        return result;
      },);

      var actual = await useCase.call("muhamadbishta@gmail.com");

      verify(repo.forgetPassword("muhamadbishta@gmail.com")).called(1);

      expect(actual, equals(result));
    });
  },);
}