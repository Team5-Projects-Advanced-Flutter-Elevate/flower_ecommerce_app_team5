import '../../../../authentication/data/models/login/login_response_dto.dart';

class EditProfileResponse {
  String? message;
  User? user;

  EditProfileResponse({this.message, this.user});

  EditProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}
