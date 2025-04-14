import 'dart:io';

import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/api/api_client/profile_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/change_password/change_password_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/edite_pofile/edite_profile_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/edite_pofile/edite_profile_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/edite_pofile/upload_image_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_executor/api_executor.dart';
import '../datasource_contract/profile_online_data_source.dart';

@Injectable(as: ProfileOnlineDataSource)
class ProfileOnlineDataSourceImpl implements ProfileOnlineDataSource {
  final ProfileApiClient _profileApiClient;

  ProfileOnlineDataSourceImpl(this._profileApiClient);
  @override
  Future<ApiResult<ChangePasswordResponse?>> changePassword(
      {required String password, required String newPassword}) async {
    var result = await ApiExecutor.executeApi(() async =>
        await _profileApiClient.changePassword(
            password: password, newPassword: newPassword));
    switch (result) {
      case Success<ChangePasswordResponse>():
        return Success(
          data: result.data,
        );
      case Error<ChangePasswordResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<EditProfileResponse?>> updateProfile(
      {required EditProfileInputModel editProfileInputModel}) async {
    var result = await ApiExecutor.executeApi(() async =>
        await _profileApiClient.editeProfile(editProfileInputModel));
    switch (result) {
      case Success<EditProfileResponse>():
        return Success(
          data: result.data,
        );
      case Error<EditProfileResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<UploadImageResponse?>> uploadProfileImage(
      {required String imagePath, required File imageFile}) async {
    var result = await ApiExecutor.executeApi(
        () async => await _profileApiClient.uploadProfileImage(
              imagePath: imagePath,
              imageFile: imageFile,
              onUploadProgress: (sent, total) {
                final progress = (sent / total * 100).round();
              },
            ));
    switch (result) {
      case Success<UploadImageResponse>():
        return Success(
          data: result.data,
        );
      case Error<UploadImageResponse>():
        return Error(error: result.error);
    }
  }
}
