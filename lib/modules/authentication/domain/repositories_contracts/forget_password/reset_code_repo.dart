import '../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/forget_password/ForgetPasswordResponse.dart';

abstract class ResetCodeRepo{
  Future<ApiResult<ForgetPasswordResponse?>> resetCode(String code);
}