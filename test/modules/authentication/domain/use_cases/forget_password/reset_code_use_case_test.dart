// import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
// import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/forget_password/reset_code_repo.dart';
// import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/reset_code_use_case.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'reset_code_use_case_test.mocks.dart';
//
// @GenerateMocks([ResetCodeRepo])
// void main() {
//   group("useCase Test",() {
//     late ResetCodeUseCase useCase;
//     late ResetCodeRepo repo;
//     setUp(() {
//       repo = MockResetCodeRepo();
//       useCase = ResetCodeUseCase(repo);
//     },);
//     test('when call method call it should '
//         'call resetCode from repo', () {
//       var result = Success<String?>(data: );
//
//       provideDummy<ApiResult<String?>>(result);
//
//       when(repo.resetCode()).thenAnswer((realInvocation) async{
//         return result;
//       },);
//
//       var actual = useCase.call(code);
//
//       verify(repo.resetCode()).called(1);
//
//       expect(actual, equals(result));
//     });
//   },);
// }