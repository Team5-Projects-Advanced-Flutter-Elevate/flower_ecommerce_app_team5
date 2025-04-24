import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edit_profile_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edit_profile_response.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/repo_contract/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepo _profileRepo;

  EditProfileUseCase(this._profileRepo);

  Future<ApiResult<EditProfileResponse?>> execute(
          {required EditProfileInputModel editProfileInputModel}) =>
      _profileRepo.updateProfile(editProfileInputModel: editProfileInputModel);
}
