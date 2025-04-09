import 'package:flower_ecommerce_app_team5/modules/authentication/data/api/api_client/auth_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/forget_password/forget_password_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_imp/forget_password/forget_password_remote_data_source_imp.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/forget_password/forget_password_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'reset_password_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([AuthApiClient])
void main() {
  group("ForgetPassword Repo", () {
    late AuthApiClient apiClient;
    late ForgetPasswordRemoteDataSource dataSource;
    setUp(() {
      apiClient = MockAuthApiClient();
      dataSource = ForgetPasswordRemoteDataSourceImpl(apiClient);
    },);
    test('TODO: Implement tests for forget_password_repo_imp.dart', () async {

      var result = ForgetPasswordResponse();

      when(apiClient.forgetPassword({"email":"muhamadbishta@gmail.com"})).thenAnswer((realInvocation) async =>  result,);

      var actual = await apiClient.forgetPassword({"email":"muhamadbishta@gmail.com"});

      verify(apiClient.forgetPassword({"email":"muhamadbishta@gmail.com"})).called(1);
      expect(actual, equals(result));
    });
  },);

}