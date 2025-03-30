import '../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/forget_password/ForgetPasswordResponse.dart';

abstract class ResetPasswordRepo{
  Future<ApiResult<ForgetPasswordResponse?>> resetPassword(String email,String newPassword);
}