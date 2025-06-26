import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/forget_password/reset_password_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/forget_password/forget_password_response.dart';

@injectable
class ResetPasswordUseCase{
  ResetPasswordRepo resetPasswordRepo;
  @factoryMethod
  ResetPasswordUseCase(this.resetPasswordRepo);
  Future<ApiResult<ForgetPasswordResponse?>> call(String email ,String newPassword) => resetPasswordRepo.resetPassword(email, newPassword);
}