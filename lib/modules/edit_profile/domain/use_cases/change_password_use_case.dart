import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/repo_contract/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../../../home/data/models/change_password/change_password_response.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepo _profileRepo;

  ChangePasswordUseCase(this._profileRepo);

  Future<ApiResult<ChangePasswordResponse?>> execute(
          {required String password, required String newPassword}) =>
      _profileRepo.changePassword(password: password, newPassword: newPassword);
}
