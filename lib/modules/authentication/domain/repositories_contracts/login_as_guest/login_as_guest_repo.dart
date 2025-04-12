import 'package:flower_ecommerce_app_team5/modules/authentication/data/respositoies_imp/login_as_guest/login_as_guest_repo_impl.dart';

import '../../../../../shared_layers/storage/result/storage_result.dart';

abstract class LoginAsGuestRepo {
  Future<StorageResult<void>> isGuest();
}
