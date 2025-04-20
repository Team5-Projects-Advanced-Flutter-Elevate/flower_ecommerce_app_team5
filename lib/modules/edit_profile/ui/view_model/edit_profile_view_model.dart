import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/dio/dio_service/dio_service.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/user_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/login/login_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edit_profile_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edit_profile_response.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/entities/upload_image_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/use_cases/change_password_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/use_cases/upload_image_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/ui/view_model/edit_profile_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../../../authentication/data/models/login/login_response_dto.dart';
import '../../../home/data/models/change_password/change_password_response.dart';

@injectable
class EditProfileViewModelCubit extends Cubit<EditProfileState> {
  EditProfileViewModelCubit(this._loginUseCase, this._editProfileUseCase,
      this._uploadImageUseCase, this._changePasswordUseCase)
      : super(const EditProfileState());
  final LoginUseCase _loginUseCase;
  final EditProfileUseCase _editProfileUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  LoginResponseDto? loginResponseDto;

  //UserDto? user;

  bool updateControllers = false;
  bool didProfileChanged = false;

  void processIntent(ProfileIntent intent) {
    switch (intent) {
      case LoadProfileIntent():
        _getProfileData();
        break;
      case LoadProfileImageIntent():
        _uploadProfileImage(intent.imageFile);
        break;
      case ChangePasswordIntent():
        _changePassword(intent.password, intent.newPassword);
        break;
      case EditProfileIntent():
        _updateProfileData(intent.editProfileInputModel);
        break;
    }
  }

  void _uploadProfileImage(File imageFile) async {
    emit(state.copyWith(uploadImageStatus: EditProfileStatus.loading));
    var useCaseResult = await _uploadImageUseCase.execute(imageFile: imageFile);
    switch (useCaseResult) {
      case Success<UploadImageResponseEntity?>():
        ApiResult<EditProfileResponse?> editProfileResult =
            await _editProfileUseCase.execute(
                editProfileInputModel: EditProfileInputModel());
        switch (editProfileResult) {
          case Success<EditProfileResponse?>():
            loginResponseDto?.user?.photo = editProfileResult.data?.user?.photo;
            _loginUseCase.cashUserData(
                loginResponseDto: loginResponseDto ?? LoginResponseDto());
            // To notify the profile layout when popping back;
            if (!didProfileChanged) didProfileChanged = true;
            emit(state.copyWith(
                uploadImageStatus: EditProfileStatus.success,
                profilePhotoLink: editProfileResult.data?.user?.photo));
          case Error<EditProfileResponse?>():
            emit(state.copyWith(
                uploadImageStatus: EditProfileStatus.error,
                error: editProfileResult.error));
        }
      case Error<UploadImageResponseEntity?>():
        emit(state.copyWith(
            uploadImageStatus: EditProfileStatus.error,
            error: useCaseResult.error));
    }
  }

  void changeButtonState(bool isEnabled) {
    emit(EditProfileState(
        changeButtonStatus:
            isEnabled ? ButtonStatus.enable : ButtonStatus.disable));
  }

  Future<void> _getProfileData() async {
    try {
      emit(state.copyWith(getProfileDataStatus: EditProfileStatus.loading));
      var profileData = await _loginUseCase.getStoredLoginInfo();
      loginResponseDto = profileData;
      final user = UserDto(
          firstName: profileData?.user?.firstName ?? 'Guest',
          lastName: profileData?.user?.lastName ?? 'Guest',
          email: profileData?.user?.email ?? 'Guest-User',
          sId: profileData?.user?.sId ?? 'Guest',
          // photo: profileData?.user?.photo ?? 'Guest',
          phone: profileData?.user?.phone ?? "+20",
          gender: profileData?.user?.gender ?? "");
      updateControllers = true;
      emit(state.copyWith(
          getProfileDataStatus: EditProfileStatus.success,
          user: user,
          profilePhotoLink: profileData?.user?.photo,
          userLoginStatus: profileData == null
              ? UserLoginStatus.guest
              : UserLoginStatus.loggedIn));
    } catch (e) {
      emit(state.copyWith(
          getProfileDataStatus: EditProfileStatus.error, error: e));
    }
  }

  void _changePassword(String password, String newPassword) async {
    emit(state.copyWith(changePasswordStatus: EditProfileStatus.loading));
    var result = await _changePasswordUseCase.execute(
        password: password, newPassword: newPassword);
    switch (result) {
      case Success<ChangePasswordResponse?>():
        // The loginResponseDto here will equal to null because we didn't get profile data in changePasswordScreen
        // loginResponseDto?.token = result.data?.token;
        // print("Caching: ${loginResponseDto == null}");
        final cachedLoginInfo = await _loginUseCase.getStoredLoginInfo();
        cachedLoginInfo?.token = result.data?.token;
        _loginUseCase.cashUserData(
            loginResponseDto: cachedLoginInfo ?? LoginResponseDto());
        DioServiceExtension.updateDioWithToken(result.data?.token ?? '');
        emit(state.copyWith(changePasswordStatus: EditProfileStatus.success));
        break;
      case Error<ChangePasswordResponse?>():
        emit(state.copyWith(
            changePasswordStatus: EditProfileStatus.error,
            error: result.error));
        break;
    }
  }

  void _updateProfileData(EditProfileInputModel editProfileInputModel) async {
    if (loginResponseDto?.user?.phone == editProfileInputModel.phone &&
        loginResponseDto?.user?.email == editProfileInputModel.email &&
        loginResponseDto?.user?.firstName == editProfileInputModel.firstName &&
        loginResponseDto?.user?.lastName == editProfileInputModel.lastName) {
      return;
    }
    emit(state.copyWith(updateProfileStatus: EditProfileStatus.loading));
    ApiResult<EditProfileResponse?> result = await _editProfileUseCase.execute(
        editProfileInputModel: editProfileInputModel);
    switch (result) {
      case Success<EditProfileResponse?>():
        loginResponseDto?.user = result.data?.user;
        _loginUseCase.cashUserData(loginResponseDto: loginResponseDto!);
        // To notify the profile layout when popping back;
        if (!didProfileChanged) didProfileChanged = true;
        emit(state.copyWith(updateProfileStatus: EditProfileStatus.success));
        break;
      case Error<EditProfileResponse?>():
        emit(state.copyWith(
            updateProfileStatus: EditProfileStatus.error, error: result.error));

        break;
    }
  }
}

sealed class ProfileIntent {}

class LoadProfileIntent extends ProfileIntent {}

class LoadProfileImageIntent extends ProfileIntent {
  final File imageFile;

  LoadProfileImageIntent(this.imageFile);
}

class ChangePasswordIntent extends ProfileIntent {
  final String password;
  final String newPassword;

  ChangePasswordIntent({required this.password, required this.newPassword});
}

class EditProfileIntent extends ProfileIntent {
  final EditProfileInputModel editProfileInputModel;

  EditProfileIntent(this.editProfileInputModel);
}
