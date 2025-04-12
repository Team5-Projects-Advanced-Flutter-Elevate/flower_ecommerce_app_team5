import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/api/api_client/auth_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/register_request.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/authentication_response.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../data_sources_contracts/register/register_online_datasource_contract.dart';

@Injectable(as: RegisterOnlineDataSource)
class RegisterOnlineDataSourceImpl implements RegisterOnlineDataSource {
  AuthApiClient authApiClient;

  RegisterOnlineDataSourceImpl(this.authApiClient);

  @override
  Future<ApiResult<AuthenticationResponseEntity>> register(
      RegisterRequest registerRequest) async {
    var result = await ApiExecutor.executeApi(
      () async => await authApiClient.register(registerRequest),
    );
    switch (result) {
      case Success<AuthenticationResponse>():
        return Success(data: result.data.toEntity());
      case Error<AuthenticationResponse>():
        return Error(error: result.error);
    }
  }
}
