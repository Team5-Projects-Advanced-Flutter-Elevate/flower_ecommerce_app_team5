import 'package:flower_ecommerce_app_team5/modules/check_out/data/models/address_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddressModel', () {
    test(
      'toEntity with non-null values should return AddressModelEntity with all fields',
      () {
        // Arrange
        final addressModel = AddressModel(
          street: '123 Main St',
          phone: '+1234567890',
          city: 'New York',
          lat: '40.7128',
          long: '-74.0060',
          username: 'john_doe',
          id: 'address_123',
        );

        // Act
        final result = addressModel.toEntity();
        final jsonResult = addressModel.toJson();

        // Verify all fields in JSON are not null
        jsonResult.forEach((key, value) {
          expect(value, isNotNull);
        });

        // Assert
        expect(result, isA<AddressEntity>());
      },
    );

    test(
      'toEntity with null values should return AddressModelEntity with null fields',
      () {
        // Arrange
        final addressModel = AddressModel();

        // Act
        final result = addressModel.toEntity();
        final jsonResult = addressModel.toJson();

        // Verify all fields in JSON are null
        jsonResult.forEach((key, value) {
          expect(value, isNull, reason: 'Field $key should be null');
        });

        // Assert
        expect(result, isA<AddressEntity>());
      },
    );
  });
}
