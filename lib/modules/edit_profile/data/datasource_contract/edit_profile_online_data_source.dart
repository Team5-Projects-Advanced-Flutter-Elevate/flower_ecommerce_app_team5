import 'dart:io';

import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edite_profile_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edite_profile_response.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/entities/upload_image_response_entity.dart';

import '../../../home/data/models/change_password/change_password_response.dart';

abstract class EditProfileOnlineDataSource {
  Future<ApiResult<EditProfileResponse?>> updateProfile(
      {required EditProfileInputModel editProfileInputModel});
  Future<ApiResult<ChangePasswordResponse?>> changePassword(
      {required String password, required String newPassword});
  Future<ApiResult<UploadImageResponseEntity?>> uploadProfileImage(
      {required File imageFile});
}
