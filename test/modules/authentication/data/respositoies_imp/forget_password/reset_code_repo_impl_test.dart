import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/forget_password/reset_code_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/forget_password/forget_password_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reset_code_repo_impl_test.mocks.dart';

@GenerateMocks([ResetCodeRemoteDataSource])
void main() {
  group("ForgetPassword Repo", () {
    //late ResetCodeRepoImpl resetCodeRepo;
    late ResetCodeRemoteDataSource dataSource;
    setUp(() {
      dataSource = MockResetCodeRemoteDataSource();
      //resetCodeRepo = ResetCodeRepoImpl(dataSource);
    },);
    test('TODO: Implement tests for forget_password_repo_imp.dart', () async {
      var result = Success<ForgetPasswordResponse?>(data: ForgetPasswordResponse());

      provideDummy<ApiResult<ForgetPasswordResponse?>>(result);

      when(dataSource.resetCode("123453")).thenAnswer((realInvocation) async => result,);

      var actual = await dataSource.resetCode("123453");

      verify(dataSource.resetCode("123453")).called(1);
      expect(actual, equals(result));
    });
  },);

}