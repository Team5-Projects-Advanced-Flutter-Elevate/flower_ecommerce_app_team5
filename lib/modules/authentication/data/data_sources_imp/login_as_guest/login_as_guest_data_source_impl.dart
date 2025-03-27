import 'package:flower_ecommerce_app_team5/shared_layers/storage/constants/storage_constants.dart';
import 'package:injectable/injectable.dart';

import '../../../../../shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart';
import '../../../../../shared_layers/storage/result/storage_result.dart';
import '../../data_sources_contracts/login_as_guest/login_as_guest_data_source.dart';

@Injectable(as: LoginAsGuestOfflineDataSource)
class LoginAsGuestOfflineDataSourceImpl implements LoginAsGuestOfflineDataSource {
  static const String isGuestK = StorageConstants.isGuestKey;
  final SecureStorageService _SecureStorageService;

  LoginAsGuestOfflineDataSourceImpl(this._SecureStorageService);
  @override
  Future<StorageResult<void>> isGuest() async {
    // TODO: implement isGuest
    _SecureStorageService.setStringValue(isGuestK,'true');
    return StorageSuccessResult(data: StorageConstants.successMessage);
  }
}
