import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/login_as_guest/login_as_guest_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/login_as_guest/login_as_guest_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../shared_layers/storage/result/storage_result.dart';

@Injectable(as: LoginAsGuestRepo)
class LoginAsGuestRepoImpl implements LoginAsGuestRepo {
  LoginAsGuestOfflineDataSource loginAsGuestOfflineDataSource;
  LoginAsGuestRepoImpl(this.loginAsGuestOfflineDataSource);
  @override
  Future<StorageResult<void>> isGuest() {
    return loginAsGuestOfflineDataSource.isGuest();
  }
}
