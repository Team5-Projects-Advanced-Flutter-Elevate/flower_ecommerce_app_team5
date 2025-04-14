import 'package:flower_ecommerce_app_team5/modules/home/data/models/edite_profile/edite_profile_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../../data/models/edite_profile/edite_profile_input_model.dart';

@injectable
class EditeProfileUseCase {
  final ProfileRepo _profileRepo;

  EditeProfileUseCase(this._profileRepo);

  Future<ApiResult<EditProfileResponse?>> execute(
          {required EditProfileInputModel editProfileInputModel}) =>
      _profileRepo.updateProfile(editProfileInputModel: editProfileInputModel);
}
