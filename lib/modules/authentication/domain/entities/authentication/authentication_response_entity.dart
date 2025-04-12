import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/user_entity.dart';

class AuthenticationResponseEntity {
  String? message;
  UserEntity? user;
  String? token;

  AuthenticationResponseEntity({
    this.message,
    this.user,
    this.token,
  });
}
