import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/forget_password/forget_password_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/forget_password/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

import '../../models/forget_password/forget_password_response.dart';
@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl extends ForgetPasswordRepo{
  ForgetPasswordRemoteDataSource apiDataSource;
  @factoryMethod
  ForgetPasswordRepoImpl(this.apiDataSource);
  @override
  Future<ApiResult<ForgetPasswordResponse?>> forgetPassword(String email) async {
    var result = await apiDataSource.forgetPassword(email);
    switch(result){
      case Success<ForgetPasswordResponse?>():
        return Success(data: result.data);
      case Error<ForgetPasswordResponse?>():
        return Error(error: result.error);
    }
  }
}