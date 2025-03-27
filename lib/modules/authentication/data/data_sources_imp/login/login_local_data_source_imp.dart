import 'dart:convert';

import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/routing/defined_routes.dart';
import '../../../../../shared_layers/storage/constants/storage_constants.dart';
import '../../../../../shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart';
import '../../data_sources_contracts/login/login_local_data_source.dart';

@Injectable(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SecureStorageService storageService;

  LoginLocalDataSourceImpl({required this.storageService});

  @override
  void cashUser({required LoginResponseDto loginResponseDto}) {
    storageService.setStringValue(
      StorageConstants.loginModelKey,
      jsonEncode(loginResponseDto.toJson()),
      DefinedRoutes
          .loginScreenRoute, // Use a constant or meaningful name instead of widget name
    );
  }

  @override
  Future<LoginResponseDto?> getCashedUser() async {
    final String? stringAuthDto = await storageService.getStringValue(
      StorageConstants.loginModelKey,
      DefinedRoutes.loginScreenRoute,
    );

    if (stringAuthDto != null) {
      return LoginResponseDto.fromJson(jsonDecode(stringAuthDto));
    }
    return null;
  }

  @override
  Future<void> deleteCachedUser() {
    return storageService.deleteValue(
      StorageConstants.loginModelKey,
      DefinedRoutes.loginScreenRoute,
    );
  }
}
