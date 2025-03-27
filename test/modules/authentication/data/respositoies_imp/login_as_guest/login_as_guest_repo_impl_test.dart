import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/respositoies_imp/login_as_guest/login_as_guest_repo_impl.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/login_as_guest/login_as_guest_data_source.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/result/storage_result.dart';

import 'login_as_guest_repo_impl_test.mocks.dart';

@GenerateMocks([LoginAsGuestOfflineDataSource])
void main() {
  late LoginAsGuestRepoImpl repoImpl;
  late LoginAsGuestOfflineDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockLoginAsGuestOfflineDataSource();
    repoImpl = LoginAsGuestRepoImpl(mockDataSource);
    provideDummy<StorageResult<void>>(StorageSuccessResult<void>(data: null));
  });

  test('should return StorageSuccessResult<void> when isGuest succeeds',
      () async {
    when(mockDataSource.isGuest())
        .thenAnswer((_) async => StorageSuccessResult<void>(data: null));

    final result = await repoImpl.isGuest();

    expect(result, isA<StorageSuccessResult<void>>());
    verify(mockDataSource.isGuest()).called(1);
  });

  test('should return StorageErrorResult<void> when isGuest fails', () async {
    when(mockDataSource.isGuest()).thenAnswer(
        (_) async => StorageErrorResult<void>(error: Exception("Error")));

    final result = await repoImpl.isGuest();

    expect(result, isA<StorageErrorResult<void>>());
    verify(mockDataSource.isGuest()).called(1);
  });
}
