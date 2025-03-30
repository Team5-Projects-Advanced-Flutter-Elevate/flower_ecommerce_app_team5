import '../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/forget_password/ForgetPasswordResponse.dart';

abstract class ForgetPasswordRepo{
  Future<ApiResult<ForgetPasswordResponse?>>forgetPassword(String email);
}