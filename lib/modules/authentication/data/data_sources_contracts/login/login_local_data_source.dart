import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';

abstract interface class LoginLocalDataSource {
  void cashUser({required LoginResponseDto loginResponseDto});

  void cacheRememberValue({required bool rememberMe});

  Future<bool> getCachedRememberValue();

  Future<void> deleteCachedRememberValue();

  Future<LoginResponseDto?> getCashedUser();

  Future<void> deleteCachedUser();
}
