import 'package:flower_ecommerce_app_team5/modules/check_out/data/models/address_model.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/data/models/address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddressResponse model', () {
    test(
      'when call toEntity with non null values it should return AddressResponseEntity',
      () {
        // arrange
        var addressResponse = AddressResponse(
          message: 'Success',
          addresses: [
            AddressModel(
              id: '1',
              username: 'username',
              street: 'street',
              city: 'city',
              lat: '12',
              long: '231',
              phone: 'phone',
            ),
          ],
        );

        // act
        var result = addressResponse.toEntity();

        // ensure addressResponse is not null
        var mappedResult = addressResponse.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNotNull);
        });

        // assert
        expect(result, isA<AddressResponseEntity>());
      },
    );

    test(
      'when call toEntity with nullable values it should return nullable AddressResponseEntity',
      () {
        // arrange
        var addressResponse = AddressResponse();

        // act
        var result = addressResponse.toEntity();

        // ensure addressResponse is null
        var mappedResult = addressResponse.toJson();
        mappedResult.forEach((key, value) {
          expect(value, isNull);
        });

        // assert
        expect(result, isA<AddressResponseEntity>());
      },
    );
  });
}
