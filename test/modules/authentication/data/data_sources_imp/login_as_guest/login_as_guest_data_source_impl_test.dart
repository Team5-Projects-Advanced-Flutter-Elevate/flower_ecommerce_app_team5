import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_imp/login_as_guest/login_as_guest_data_source_impl.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/constants/storage_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/result/storage_result.dart';

import 'login_as_guest_data_source_impl_test.mocks.dart';

@GenerateMocks([SecureStorageService])
void main() {
  late LoginAsGuestOfflineDataSourceImpl dataSource;
  late SecureStorageService mockStorageService;

  setUp(() {
    mockStorageService = MockSecureStorageService();
    dataSource = LoginAsGuestOfflineDataSourceImpl(mockStorageService);
  });

  test('should call SecureStorageService.setStringValue with correct key and value', () async {
    // ✅ تنفيذ `isGuest()`
    final result = await dataSource.isGuest();

    // ✅ تحقق أن `setStringValue` تم استدعاؤها بالقيم الصحيحة
    verify(mockStorageService.setStringValue(StorageConstants.isGuestKey, 'true')).called(1);

    // ✅ تحقق أن النتيجة `StorageSuccessResult<void>`
    expect(result, isA<StorageSuccessResult<void>>());
    expect((result as StorageSuccessResult).data, StorageConstants.successMessage);
  });
}
