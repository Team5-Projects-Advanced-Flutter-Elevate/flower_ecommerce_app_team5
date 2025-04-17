import 'dart:io';

import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/datasource_contract/edit_profile_online_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edite_profile_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edite_profile_response.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/entities/upload_image_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/change_password/change_password_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/edit_profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final EditProfileOnlineDataSource _profileOnlineDataSource;

  ProfileRepoImpl(this._profileOnlineDataSource);
  @override
  Future<ApiResult<ChangePasswordResponse?>> changePassword(
      {required String password, required String newPassword}) async {
    return await _profileOnlineDataSource.changePassword(
        password: password, newPassword: newPassword);
  }

  @override
  Future<ApiResult<EditProfileResponse?>> updateProfile(
      {required EditProfileInputModel editProfileInputModel}) async {
    return await _profileOnlineDataSource.updateProfile(
        editProfileInputModel: editProfileInputModel);
  }

  @override
  Future<ApiResult<UploadImageResponseEntity?>> uploadProfileImage(
      {required File imageFile}) async {
    return await _profileOnlineDataSource.uploadProfileImage(
        imageFile: imageFile);
  }
}
