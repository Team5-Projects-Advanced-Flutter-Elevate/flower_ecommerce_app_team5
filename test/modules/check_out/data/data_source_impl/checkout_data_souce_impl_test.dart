import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/data/api/api_client/check_out_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/data/data_source_impl/checkout_data_souce_impl.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/data/models/address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_data_souce_impl_test.mocks.dart';

@GenerateMocks([CheckOutApiClient])
void main() {
  late MockCheckOutApiClient mockCheckOutApiClient;
  late CheckOutDataSourceImpl checkOutDataSourceImpl;

  setUpAll(() {
    mockCheckOutApiClient = MockCheckOutApiClient();
    checkOutDataSourceImpl = CheckOutDataSourceImpl(mockCheckOutApiClient);
  });

  group('CheckOutDataSourceImpl', () {
    group('getAllAddresses', () {
      test(
          'should return Success with AddressResponseEntity when API call succeeds',
          () async {
        // Arrange
        final mockResponse = AddressResponse(message: 'Success', addresses: []);
        when(mockCheckOutApiClient.getAllAddresses())
            .thenAnswer((_) async => mockResponse);

        // Act
        final result = await checkOutDataSourceImpl.getAllAddresses();

        // Assert
        expect(result, isA<Success<AddressResponseEntity>>());
        expect((result as Success).data, isA<AddressResponseEntity>());
        verify(mockCheckOutApiClient.getAllAddresses()).called(1);
      });

      test('should return Error when API call fails', () async {
        // Arrange
        final mockError = Exception('Failed to fetch addresses');
        when(mockCheckOutApiClient.getAllAddresses()).thenThrow(mockError);

        // Act
        final result = await checkOutDataSourceImpl.getAllAddresses();

        // Assert
        expect(result, isA<Error<AddressResponseEntity>>());
        expect((result as Error).error, equals(mockError));
        verify(mockCheckOutApiClient.getAllAddresses()).called(1);
      });
    });
  });
}
