// import 'package:bloc_test/bloc_test.dart';
// import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/forget_password_use_case.dart';
// import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/reset_code_use_case.dart';
// import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/forget_password/reset_password_use_case.dart';
// import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view_model/forget_password_screen_view_model.dart';
// import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view_model/forget_password_state.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
//
// import 'forget_password_screen_view_model_test.mocks.dart';
// @GenerateMocks([ForgetPasswordUseCase,ResetPasswordUseCase,ResetCodeUseCase])
// void main() {
//   group("ForgetPassword ViewModel Test", () {
//     late ForgetPasswordViewModel forgetPasswordViewModel;
//     late ForgetPasswordUseCase forgetPasswordUseCase;
//     late ResetPasswordUseCase resetPasswordUseCase;
//     late ResetCodeUseCase resetCodeUseCase;
//     setUp(() {
//       forgetPasswordUseCase = MockForgetPasswordUseCase();
//       resetPasswordUseCase = MockResetPasswordUseCase();
//       resetCodeUseCase = MockResetCodeUseCase();
//
//       forgetPasswordViewModel = ForgetPasswordViewModel(forgetPasswordUseCase, resetPasswordUseCase, resetCodeUseCase);
//     },);
//     blocTest<ForgetPasswordViewModel ,PasswordState>("when call onIntent with load ForgetPassword intent "
//         "it should load ForgotPassword and ResetPassword and ResetCode and return the correct state ",
//       build: () => forgetPasswordViewModel,
//       act: (viewModel){
//       viewModel.onIntent();
//       },
//     );
//   },);
// }