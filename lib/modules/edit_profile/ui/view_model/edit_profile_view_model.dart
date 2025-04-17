import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/dio/dio_service/dio_service.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/login/login_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edite_profile_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edite_profile_response.dart';
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
  EditProfileViewModelCubit(this._loginUseCase, this._editeProfileUseCase,
      this._uploadImageUseCase, this._changePasswordUseCase)
      : super(ProfileInitial());
  final LoginUseCase _loginUseCase;
  final EditeProfileUseCase _editeProfileUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  LoginResponseDto? loginResponseDto;
  User? user;
  String profilePhoto = '';
  bool isButtonEnabled = false;
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
      case EditeProfileIntent():
        _updateProfileData(intent.editProfileInputModel);
        break;
    }
  }

  void _uploadProfileImage(File imageFile) async {
    emit(ProfileLoading());
    var useCaseResult = await _uploadImageUseCase.execute(imageFile: imageFile);
    switch (useCaseResult) {
      case Success<UploadImageResponseEntity?>():
        emit(ProfileSuccess());
      case Error<UploadImageResponseEntity?>():
        emit(ProfileError(useCaseResult.error));
    }
  }

  void changeButtonState(String? confirmPassword, String? newPassword) {
    if (confirmPassword == newPassword) {
      emit(ProfileEnableChangePasswordButton());
    }
  }

  Future<void> _getProfileData() async {
    try {
      emit(ProfileLoading());
      var profileData = await _loginUseCase.getStoredLoginInfo();
      var name = profileData?.user?.firstName ?? 'Guest';
      var email = profileData?.user?.email ?? 'Guest-User';
      var id = profileData?.user?.sId ?? 'Guest';
      var image = profileData?.user?.photo ?? 'Guest';
      loginResponseDto = profileData;
      user = profileData!.user;
      profilePhoto = image;
      emit(ProfileDataSuccess(name, email, id, image, profileData.user!.phone!,
          profileData.user!.gender!, profileData.user!.lastName!));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  _changePassword(String password, String newPassword) async {
    emit(ProfileLoading());
    var result = await _changePasswordUseCase.execute(
        password: password, newPassword: newPassword);
    switch (result) {
      case Success<ChangePasswordResponse?>():
        loginResponseDto?.token = result.data?.token;
        _loginUseCase.cashUserData(
            loginResponseDto: loginResponseDto ?? LoginResponseDto());
        DioServiceExtension.updateDioWithToken(result.data?.token ?? '');
        emit(ProfileSuccess());
        break;
      case Error<ChangePasswordResponse?>():
        emit(ProfileError(result.error));
        break;
    }
  }

  _updateProfileData(EditProfileInputModel editProfileInputModel) async {
    if (user!.phone == editProfileInputModel.phone &&
        user!.email == editProfileInputModel.email &&
        user!.firstName == editProfileInputModel.firstName &&
        user!.lastName == editProfileInputModel.lastName) {
      return;
    }
    emit(ProfileLoading());
    ApiResult<EditProfileResponse?> result = await _editeProfileUseCase.execute(
        editProfileInputModel: editProfileInputModel);
    switch (result) {
      case Success<EditProfileResponse?>():
        user = result.data!.user;
        _loginUseCase.cashUserData(loginResponseDto: loginResponseDto!);
        emit(ProfileDataSuccess(user!.firstName!, user!.email!, user!.sId!,
            user!.photo!, user!.phone!, user!.gender!, user!.lastName!));
        emit(ProfileSuccess());
        break;
      case Error<EditProfileResponse?>():
        emit(ProfileError(result.error));
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

class EditeProfileIntent extends ProfileIntent {
  final EditProfileInputModel editProfileInputModel;

  EditeProfileIntent(this.editProfileInputModel);
}
