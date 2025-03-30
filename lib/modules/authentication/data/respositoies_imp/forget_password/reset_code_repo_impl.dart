import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/forget_password/reset_code_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/forget_password/reset_code_repo.dart';
import 'package:injectable/injectable.dart';

import '../../models/forget_password/ForgetPasswordResponse.dart';

@Injectable(as: ResetCodeRepo)
class ResetCodeRepoImpl extends ResetCodeRepo{
  ResetCodeRemoteDataSource apiDataSource;
  @factoryMethod
  ResetCodeRepoImpl(this.apiDataSource);
  @override
  Future<ApiResult<ForgetPasswordResponse?>> resetCode(String code) async{
    var result = await apiDataSource.resetCode(code);
    switch(result){
      case Success<ForgetPasswordResponse?>():
        return Success(data: result.data);
      case Error<ForgetPasswordResponse?>():
        return Error(error: result.error);
    }
  }
}