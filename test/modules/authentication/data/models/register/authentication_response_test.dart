import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/authentication_response.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/userDM.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationResponse', () {
    test(
      'when call toEntity with non null values it should return AuthenticationResponseEntity',
      () {
        // arrange
        var authenticationResponse = AuthenticationResponse(
          message: 'message',
          user: UserDM(
            email: 'email',
            firstName: 'firstName',
            lastName: 'lastName',
            gender: 'gender',
            phone: 'phone',
            id: 'id',
            role: 'role',
            createdAt: 'createdAt',
            photo: 'photo',
          ),
          token: 'token',
        );
        // act
        var result = authenticationResponse.toEntity();
        // assert
        expect(result, isA<AuthenticationResponseEntity>());
      },
    );

    test(
      'when call toEntity with non nullable values it should return AuthenticationResponseEntity',
      () {
        // arrange
        var authenticationResponse = AuthenticationResponse();
        // act
        var result = authenticationResponse.toEntity();
        // assert
        expect(result, isA<AuthenticationResponseEntity?>());
      },
    );
  });
}
