import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/register/register_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/register/register_request.dart';
import '../../entities/authentication/authentication_response_entity.dart';

@injectable
class RegisterUseCase {
  RegisterRepo registerRepo;

  RegisterUseCase(this.registerRepo);

  Future<ApiResult<AuthenticationResponseEntity>> execute(
          RegisterRequest registerRequest) =>
      registerRepo.register(registerRequest);
}
