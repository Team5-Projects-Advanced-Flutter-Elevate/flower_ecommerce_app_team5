//
// sealed class EditProfileState {}
//
// class ProfileInitial extends EditProfileState {}
//
// class ProfileSuccess extends EditProfileState {}
//
// class ProfileLoading extends EditProfileState {}
//
// class ProfileDataSuccess extends EditProfileState {
//   final String name;
//   final String lastName;
//   final String email;
//   final String id;
//   final String photo;
//   final String phone;
//   final String gender;
//   ProfileDataSuccess(this.name, this.email, this.id, this.photo, this.phone,
//       this.gender, this.lastName);
//
// }
//
// class ProfileError extends EditProfileState {
//   final Object error;
//   ProfileError(this.error);
// }
//
// class ProfileEnableChangePasswordButton extends EditProfileState {}

import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/user_dto.dart';

enum EditProfileStatus { initial, loading, success, error }

enum ButtonStatus { enable, disable }

class EditProfileState extends Equatable {
  final EditProfileStatus uploadImageStatus;
  final EditProfileStatus getProfileDataStatus;
  final EditProfileStatus changePasswordStatus;
  final EditProfileStatus updateProfileStatus;
  final ButtonStatus changeButtonStatus;
  final String? profilePhotoLink;
  final UserDto? user;

  final Object? error;
  const EditProfileState(
      {this.uploadImageStatus = EditProfileStatus.initial,
      this.getProfileDataStatus = EditProfileStatus.initial,
      this.changePasswordStatus = EditProfileStatus.initial,
      this.updateProfileStatus = EditProfileStatus.initial,
      this.changeButtonStatus = ButtonStatus.enable,
      this.profilePhotoLink,
      this.user,
      this.error});
  @override
  List<Object?> get props => [
        uploadImageStatus,
        updateProfileStatus,
        changeButtonStatus,
        profilePhotoLink,
        getProfileDataStatus,
        changePasswordStatus,
        user,
        error
      ];

  EditProfileState copyWith(
      {EditProfileStatus? uploadImageStatus,
      EditProfileStatus? getProfileDataStatus,
      EditProfileStatus? changePasswordStatus,
      EditProfileStatus? updateProfileStatus,
      ButtonStatus? changeButtonStatus,
      String? profilePhotoLink,
      UserDto? user,
      Object? error}) {
    print("copyWith UpdateProfileStatus $updateProfileStatus");
    return EditProfileState(
        uploadImageStatus: uploadImageStatus ?? this.uploadImageStatus,
        getProfileDataStatus: getProfileDataStatus ?? this.getProfileDataStatus,
        changePasswordStatus: changePasswordStatus ?? this.changePasswordStatus,
        updateProfileStatus: updateProfileStatus ?? this.updateProfileStatus,
        changeButtonStatus: changeButtonStatus ?? this.changeButtonStatus,
        profilePhotoLink: profilePhotoLink ?? this.profilePhotoLink,
        user: user ?? this.user,
        error: error ?? this.error);
  }
}
