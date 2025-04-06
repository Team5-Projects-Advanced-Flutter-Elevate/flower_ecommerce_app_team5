import 'package:flower_ecommerce_app_team5/modules/authentication/data/api/api_client/auth_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/forget_password/reset_code_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_imp/forget_password/reset_code_remote_data_source_impl.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/forget_password/ForgetPasswordResponse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'forget_password_remote_data_source_imp_test.mocks.dart';

@GenerateMocks([AuthApiClient])
void main() {
  group("ForgetPassword Repo", () {
    late AuthApiClient apiClient;
    late ResetCodeRemoteDataSource dataSource;
    setUp(() {
      apiClient = MockAuthApiClient();
      dataSource = ResetCodeRemoteDataSourceImpl(apiClient);
    },);
    test('TODO: Implement tests for forget_password_repo_imp.dart', () async {

      var result = ForgetPasswordResponse();

      when(apiClient.resetCode({"resetCode": "123456"})).thenAnswer((realInvocation) async =>  result,);

      var actual = await apiClient.resetCode({"resetCode": "123456"});

      verify(apiClient.resetCode({"resetCode": "123456"})).called(1);
      expect(actual, equals(result));
    });
  },);

}