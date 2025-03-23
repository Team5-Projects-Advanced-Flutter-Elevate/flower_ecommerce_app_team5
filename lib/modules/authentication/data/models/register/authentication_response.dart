import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';

import 'userDM.dart';

class AuthenticationResponse {
  AuthenticationResponse({
    this.message,
    this.user,
    this.token,
  });

  AuthenticationResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDM.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDM? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthenticationResponseEntity toEntity() => AuthenticationResponseEntity(
        message: message,
        user: user?.toEntity(),
        token: token,
      );
}
