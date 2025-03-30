import '../../../../../core/apis/api_result/api_result.dart';
import '../../models/forget_password/ForgetPasswordResponse.dart';

abstract class ResetPasswordRemoteDataSource{
  Future<ApiResult<ForgetPasswordResponse?>> resetPassword(String email,String newPassword);
}