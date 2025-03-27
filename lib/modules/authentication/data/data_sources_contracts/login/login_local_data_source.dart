import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';

abstract interface class LoginLocalDataSource {
  void cashUser({required LoginResponseDto loginResponseDto});

  Future<LoginResponseDto?> getCashedUser();

  Future<void> deleteCachedUser();
}
