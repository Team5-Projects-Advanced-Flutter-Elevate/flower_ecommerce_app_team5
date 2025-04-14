import 'dart:io';

import '../../../../core/apis/api_result/api_result.dart';
import '../../data/models/change_password/change_password_response.dart';
import '../../data/models/edite_profile/edite_profile_input_model.dart';
import '../../data/models/edite_profile/edite_profile_response.dart';
import '../../data/models/edite_profile/upload_image_response.dart';

abstract class ProfileRepo {
  Future<ApiResult<EditProfileResponse?>> updateProfile(
      {required EditProfileInputModel editProfileInputModel});
  Future<ApiResult<ChangePasswordResponse?>> changePassword(
      {required String password, required String newPassword});
  Future<ApiResult<UploadImageResponse?>> uploadProfileImage(
      {required File imageFile});
}
