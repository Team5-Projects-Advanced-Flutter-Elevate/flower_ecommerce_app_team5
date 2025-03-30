// import 'package:flower_ecommerce_app_team5/modules/authentication/data/data_sources_contracts/forget_password/reset_code_remote_data_source.dart';
// import 'package:flower_ecommerce_app_team5/modules/authentication/data/respositoies_imp/forget_password/reset_code_repo_impl.dart';
// import 'package:flower_ecommerce_app_team5/modules/authentication/domain/repositories_contracts/forget_password/reset_code_repo.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
//
// @GenerateMocks([ResetCodeRemoteDataSource])
// void main() {
//   group("resetCode repo",() {
//     late ResetCodeRepoImpl resetCodeRepo;
//     late ResetCodeRemoteDataSource remoteDataSource;
//     setUp(() {
//       remoteDataSource = MockResetCodeRemoteDataSource();
//       resetCodeRepo = ResetCodeRepoImpl(remoteDataSource);
//     },);
//   },);
//   test('when call resetCode the '
//       'it should call resetCode from repo', () async{
//     await resetCodeRepo.resetCode(code);
//   });
// }