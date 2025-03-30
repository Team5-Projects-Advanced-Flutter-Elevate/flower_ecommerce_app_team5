import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/forget_password/reset_password_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/forget_password/reset_password_repo.dart';
import 'package:injectable/injectable.dart';
import '../../models/forget_password/ForgetPasswordResponse.dart';

@Injectable(as: ResetPasswordRepo)
class ResetPasswordRepoImpl extends ResetPasswordRepo{
  ResetPasswordRemoteDataSource apiDataSource;
  @factoryMethod
  ResetPasswordRepoImpl(this.apiDataSource);
  @override
  Future<ApiResult<ForgetPasswordResponse?>> resetPassword(String email, String newPassword) async {
    var result = await apiDataSource.resetPassword(email, newPassword);
    switch(result){
      case Success<ForgetPasswordResponse?>():
        return Success(data: result.data);
      case Error<ForgetPasswordResponse?>():
        return Error(error: result.error);
    }
  }
}