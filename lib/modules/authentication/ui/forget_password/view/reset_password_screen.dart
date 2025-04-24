import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view/forget_password_screen.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/routing/defined_routes.dart';
import '../../../../../core/validation/validation_functions.dart';
import '../../../../../core/widgets/error_state_widget.dart';
import '../../../../../core/widgets/loading_state_widget.dart';
import '../view_model/forget_password_screen_view_model.dart';
import '../view_model/forget_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

late TextEditingController newPasswordController;
late TextEditingController confirmPasswordController;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _ResetPasswordScreenState
    extends BaseStatefulWidgetState<ResetPasswordScreen> {
  final ForgetPasswordViewModel forgetPasswordViewModel =
      getIt.get<ForgetPasswordViewModel>();
  bool isNewPasswordObscure = true, isConfirmPasswordObscure = true;

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocProvider(
        create: (context) => forgetPasswordViewModel,
        child: BlocConsumer<ForgetPasswordViewModel, PasswordState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, DefinedRoutes.loginScreenRoute),
                    child: Icon(Icons.arrow_back_ios, size: screenWidth * 0.05),
                  ),
                  Text(
                    LocaleKeys.password.tr(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        LocaleKeys.resetPassword.tr(),
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontSize: screenWidth * 0.045,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        LocaleKeys.passwordVerificationRole.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      TextFormField(
                        validator: (value) => ValidateFunctions.getInstance()
                            .validationOfPassword(value),
                        controller: newPasswordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: isNewPasswordObscure,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          enabled: true,
                          hintText: LocaleKeys.enterYourPassword.tr(),
                          labelText: LocaleKeys.newPassword.tr(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isNewPasswordObscure = !isNewPasswordObscure;
                              });
                            },
                            icon: Icon(isNewPasswordObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      TextFormField(
                        validator: (value) => ValidateFunctions.getInstance()
                            .validationOfConfirmPassword(
                                value, newPasswordController.text),
                        controller: confirmPasswordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: isConfirmPasswordObscure,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          enabled: true,
                          hintText: LocaleKeys.confirmPassword.tr(),
                          labelText: LocaleKeys.confirmPassword.tr(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordObscure = !isConfirmPasswordObscure;
                              });
                            },
                            icon: Icon(isConfirmPasswordObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.06),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            forgetPasswordViewModel.onIntent(
                              ResetPasswordIntent(emailController.text,
                                  newPasswordController.text.trim()),
                            );
                          }
                        },
                        style: ButtonStyle(
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.018))),
                        child: Text(LocaleKeys.confirm.tr()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          listener: (context, state) {
            if (state is PasswordSuccessState) {
              displayAlertDialog(
                title:  Text(LocaleKeys.passwordResetSuccessfully.tr()),
                showOkButton: true,
                onOkButtonClick: () {
                  hideAlertDialog();
                  Navigator.pushReplacementNamed(
                      context, DefinedRoutes.loginScreenRoute);
                },
              );
            } else if (state is PasswordErrorState) {
              ErrorStateWidget(error: state.error);
            } else if (state is PasswordLoadingState) {
              const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
