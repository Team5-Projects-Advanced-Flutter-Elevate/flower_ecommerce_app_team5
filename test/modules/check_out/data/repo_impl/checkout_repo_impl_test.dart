import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/data/data_source_contract/chechout_data_souce_contract.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/data/repo_impl/checkout_repo_impl.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_repo_impl_test.mocks.dart';

@GenerateMocks([CheckOutDataSource])
void main() {
  late MockCheckOutDataSource mockCheckOutDataSource;
  late CheckOutRepoImpl checkOutRepoImpl;

  setUpAll(() {
    mockCheckOutDataSource = MockCheckOutDataSource();
    checkOutRepoImpl =
        CheckOutRepoImpl(checkOutDataSource: mockCheckOutDataSource);
  });

  group('CheckOutRepoImpl', () {
    group('getAllAddresses', () {
      test(
          'should return Success<AddressResponseEntity> when data source succeeds',
          () async {
        // Arrange
        final expectedResponse = AddressResponseEntity();
        provideDummy<ApiResult<AddressResponseEntity>>(
            Success(data: expectedResponse));
        when(mockCheckOutDataSource.getAllAddresses())
            .thenAnswer((_) async => Success(data: expectedResponse));

        // Act
        final result = await checkOutRepoImpl.getAllAddresses();

        // Assert
        expect(result, isA<Success<AddressResponseEntity>>());
        expect((result as Success).data, equals(expectedResponse));
        verify(mockCheckOutDataSource.getAllAddresses()).called(1);
      });

      test('should return Error<AddressResponseEntity> when data source throws',
          () async {
        // Arrange
        provideDummy<ApiResult<AddressResponseEntity>>(
          Error(
            error: Exception('Failed to fetch addresses'),
          ),
        );
        when(mockCheckOutDataSource.getAllAddresses()).thenAnswer(
          (_) async => Error(
            error: Exception('Failed to fetch addresses'),
          ),
        );
        // Act
        final result = await checkOutRepoImpl.getAllAddresses();

        // Assert
        expect(result, isA<Error<AddressResponseEntity>>());
        expect((result as Error).error, isException);
        verify(mockCheckOutDataSource.getAllAddresses()).called(1);
      });
    });
  });
}
