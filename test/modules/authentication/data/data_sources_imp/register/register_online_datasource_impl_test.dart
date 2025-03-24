import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/api/api_client/auth_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/register/register_online_datasource_contract.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_imp/register/register_online_datasource_impl.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/authentication_response.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/register_request.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_online_datasource_impl_test.mocks.dart';

@GenerateMocks([AuthApiClient])
void main() {
  late MockAuthApiClient mockAuthApiClient;
  late RegisterOnlineDataSource registerOnlineDataSource;
  setUpAll(() {
    mockAuthApiClient = MockAuthApiClient();
    registerOnlineDataSource = RegisterOnlineDataSourceImpl(mockAuthApiClient);
  });
  group('register online data source impl ', () {
    test('register success ', () async {
      // arrange
      when(mockAuthApiClient.register(any)).thenAnswer(
        (_) async => AuthenticationResponse(),
      );
      // act
      var result = await registerOnlineDataSource.register(RegisterRequest());
      // assert
      expect(result, isA<Success<AuthenticationResponseEntity>>());
    });
    test('register error ', () async {
      // arrange
      when(mockAuthApiClient.register(any)).thenThrow(
        (_) async => AuthenticationResponse(),
      );
      // act
      var result = await registerOnlineDataSource.register(RegisterRequest());
      // assert
      expect(result, isA<Error<AuthenticationResponseEntity>>());
    });
  });
}
