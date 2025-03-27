import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/login_as_guest/login_as_guest_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../shared_layers/storage/result/storage_result.dart';

@injectable
class LoginAsGuest {
  LoginAsGuestRepo loginAsGuestRepo;

  LoginAsGuest(this.loginAsGuestRepo);

  Future<StorageResult<void>> isGuest() async {
    return loginAsGuestRepo.isGuest();
  }
}
