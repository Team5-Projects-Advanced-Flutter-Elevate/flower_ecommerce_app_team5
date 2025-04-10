import 'package:flower_ecommerce_app_team5/shared_layers/storage/constants/storage_constants.dart';
import 'package:injectable/injectable.dart';

import '../../../../../shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart';
import '../../../../../shared_layers/storage/result/storage_result.dart';
import '../../data_sources_contracts/login_as_guest/login_as_guest_data_source.dart';

@Injectable(as: LoginAsGuestOfflineDataSource)
class LoginAsGuestOfflineDataSourceImpl
    implements LoginAsGuestOfflineDataSource {
  final SecureStorageService _secureStorageService;

  LoginAsGuestOfflineDataSourceImpl(this._secureStorageService);
  @override
  Future<StorageResult<void>> isGuest() async {
    _secureStorageService.setStringValue(StorageConstants.isGuestKey, 'true');
    return StorageSuccessResult<String>(data: StorageConstants.successMessage);
  }
}
