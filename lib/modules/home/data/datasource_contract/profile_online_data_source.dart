import 'dart:io';

import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/edite_pofile/upload_image_response.dart';

import '../models/change_password/change_password_response.dart';
import '../models/edite_pofile/edite_profile_input_model.dart';
import '../models/edite_pofile/edite_profile_response.dart';

abstract class ProfileOnlineDataSource {
  Future<ApiResult<EditProfileResponse?>> updateProfile(
      {required EditProfileInputModel editProfileInputModel});
  Future<ApiResult<ChangePasswordResponse?>> changePassword(
      {required String password, required String newPassword});
  Future<ApiResult<UploadImageResponse?>> uploadProfileImage(
      {required String imagePath, required File imageFile});
}
