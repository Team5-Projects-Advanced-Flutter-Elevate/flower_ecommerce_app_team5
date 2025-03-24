import '../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/login/login_input_model.dart';
import '../../../data/models/login/login_response_dto.dart';

abstract class LoginRepo {
  Future<ApiResult<LoginResponseDto>> login(
      {required LoginInputModel loginInputModel});
}
