import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/login_as_guest/login_as_gust_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/login_as_guest/login_as_guest_repo.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/result/storage_result.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/mockito.dart';

import 'login_as_gust_use_case_test.mocks.dart';

// Generate a mock class for LoginAsGuestRepo
@GenerateMocks([LoginAsGuestRepo])
void main() {
  late LoginAsGuest useCase;
  late LoginAsGuestRepo mockRepo;

  setUp(() {
    mockRepo = MockLoginAsGuestRepo();
    useCase = LoginAsGuest(mockRepo);
    provideDummy<StorageResult<void>>(StorageSuccessResult<void>(data: null));
  });

  test("should return StorageResult<void> when calling isGuest", () async {
    // Arrange: Define the expected return value
    final expectedResult = StorageSuccessResult<void>(data: null);

    when(mockRepo.isGuest()).thenAnswer((_) async => expectedResult);

    // Act: Call the function
    final result = await useCase.isGuest();

    // Assert: Check if the function returned the expected result
    expect(result, expectedResult);
    verify(mockRepo.isGuest()).called(1); // Ensure the method was called
    verifyNoMoreInteractions(mockRepo); // Ensure no other interactions happened
  });
}
