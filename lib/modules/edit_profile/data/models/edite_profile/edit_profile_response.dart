import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/user_dto.dart';


class EditProfileResponse {
  String? message;
  UserDto? user;

  EditProfileResponse({this.message, this.user});

  EditProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
  }
}
