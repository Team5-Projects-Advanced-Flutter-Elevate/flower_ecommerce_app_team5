import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_dm.dart';

part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  AuthenticationResponse({
    this.message,
    this.user,
    this.token,
  });

  factory AuthenticationResponse.fromJson(dynamic json) =>
      _$AuthenticationResponseFromJson(json);

  String? message;
  UserDm? user;
  String? token;

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);

  AuthenticationResponseEntity toEntity() => AuthenticationResponseEntity(
        message: message,
        user: user?.toEntity(),
        token: token,
      );
}
