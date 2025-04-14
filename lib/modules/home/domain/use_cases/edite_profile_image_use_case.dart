import 'dart:io';

import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../../data/models/edite_profile/upload_image_response.dart';

@injectable
class EditeProfileImageUseCase {
  final ProfileRepo _profileRepo;

  EditeProfileImageUseCase(this._profileRepo);

  Future<ApiResult<UploadImageResponse?>> execute({required File imageFile}) =>
      _profileRepo.uploadProfileImage(imageFile: imageFile);
}
