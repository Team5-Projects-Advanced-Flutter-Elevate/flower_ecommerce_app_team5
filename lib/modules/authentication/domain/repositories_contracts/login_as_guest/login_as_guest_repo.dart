
import '../../../../../shared_layers/storage/result/storage_result.dart';

abstract class LoginAsGuestRepo {
  Future<StorageResult<void>> isGuest();
}
