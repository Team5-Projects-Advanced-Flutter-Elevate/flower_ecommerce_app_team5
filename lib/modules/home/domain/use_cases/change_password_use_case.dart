import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../../data/models/change_password/change_password_response.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepo _profileRepo;

  ChangePasswordUseCase(this._profileRepo);

  Future<ApiResult<ChangePasswordResponse?>> execute(
          {required String password, required String newPassword}) =>
      _profileRepo.changePassword(password: password, newPassword: newPassword);
}
