import '../../../../../shared_layers/storage/result/storage_result.dart';

abstract class LoginAsGuestOfflineDataSource {
  Future<StorageResult<void>> isGuest();
}
