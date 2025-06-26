import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/forget_password/forget_password_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/forget_password/forget_password_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_repo_imp_test.mocks.dart';

@GenerateMocks([ForgetPasswordRemoteDataSource])
void main() {
  group("ForgetPassword Repo", () {
    //late ForgetPasswordRepoImpl forgetPasswordRepo;
    late ForgetPasswordRemoteDataSource dataSource;
    setUp(() {
      dataSource = MockForgetPasswordRemoteDataSource();
      //forgetPasswordRepo = ForgetPasswordRepoImpl(dataSource);
    },);
    test('TODO: Implement tests for forget_password_repo_imp.dart', () async {
      var result = Success<ForgetPasswordResponse?>(data: ForgetPasswordResponse());

      provideDummy<ApiResult<ForgetPasswordResponse?>>(result);

      when(dataSource.forgetPassword("muhamadbishta@gmail.com")).thenAnswer((realInvocation) async => result,);

      var actual = await dataSource.forgetPassword("muhamadbishta@gmail.com");

      verify(dataSource.forgetPassword("muhamadbishta@gmail.com")).called(1);
      expect(actual, equals(result));
    });
  },);
  
}