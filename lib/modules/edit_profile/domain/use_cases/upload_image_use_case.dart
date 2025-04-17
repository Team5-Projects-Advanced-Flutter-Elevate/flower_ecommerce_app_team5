import 'dart:io';

import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/entities/upload_image_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/repo_contract/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';

@injectable
class UploadImageUseCase {
  final ProfileRepo _profileRepo;

  UploadImageUseCase(this._profileRepo);

  Future<ApiResult<UploadImageResponseEntity?>> execute({required File imageFile}) =>
      _profileRepo.uploadProfileImage(imageFile: imageFile);
}
