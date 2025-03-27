import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/register/register_online_datasource_contract.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/register_request.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repositories_contracts/register/register_repo.dart';
@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo {
  RegisterOnlineDataSource registerOnlineDataSource;

  RegisterRepoImpl(this.registerOnlineDataSource);

  @override
  Future<ApiResult<AuthenticationResponseEntity>> register(
      RegisterRequest registerRequest) async {
    return registerOnlineDataSource.register(registerRequest);
  }
}
