import 'dart:io';

import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/api/api_client/profile_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/api/api_client/upload_image_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/change_password_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edite_profile_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edite_profile_response.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/upload_image_response.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/entities/upload_image_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/change_password/change_password_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_executor/api_executor.dart';
import '../datasource_contract/edit_profile_online_data_source.dart';

@Injectable(as: EditProfileOnlineDataSource)
class EditProfileOnlineDataSourceImpl implements EditProfileOnlineDataSource {
  final ProfileApiClient _profileApiClient;
  final UploadImageApiClient _uploadImageApiClient;

  EditProfileOnlineDataSourceImpl(
      this._profileApiClient, this._uploadImageApiClient);
  @override
  Future<ApiResult<ChangePasswordResponse?>> changePassword(
      {required String password, required String newPassword}) async {
    var result = await ApiExecutor.executeApi(
        () async => await _profileApiClient.changePassword(
                changePasswordInputModel: ChangePasswordInputModel(
              password: password,
              newPassword: newPassword,
            )));
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
  Future<ApiResult<UploadImageResponseEntity?>> uploadProfileImage(
      {required File imageFile}) async {
    var apiResult = await ApiExecutor.executeApi(
      () {
        return _uploadImageApiClient.uploadProfileImageWithDio(imageFile);
      },
    );
    switch (apiResult) {
      case Success<UploadImageResponse>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<UploadImageResponse>():
        return Error(error: apiResult.error);
    }
  }
}
