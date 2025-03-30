import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/api/api_client/auth_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/forget_password/reset_password_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/apis/api_executor/api_executor.dart';
import '../../models/forget_password/ForgetPasswordResponse.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl extends ResetPasswordRemoteDataSource{
  AuthApiClient apiClient;
  @factoryMethod
  ResetPasswordRemoteDataSourceImpl(this.apiClient);
  @override
  Future<ApiResult<ForgetPasswordResponse?>> resetPassword(String email, String newPassword) async{
    var result = await ApiExecutor.executeApi(() async {
      var response = await apiClient.resetPassword({
        "email": email,
        "newPassword": newPassword
      });
      return response;
    });
    switch(result){
      case Success<ForgetPasswordResponse?>() :
        return Success(data: result.data);
      case Error<ForgetPasswordResponse?>():
        return Error(error: result.error);
    }
  }

}