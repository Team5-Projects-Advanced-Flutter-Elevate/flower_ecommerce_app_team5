import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/routing/defined_routes.dart';
import '../../../../../core/widgets/error_state_widget.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../view_model/forget_password_screen_view_model.dart';
import '../view_model/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

late TextEditingController emailController;

class _ForgetPasswordScreenState extends BaseStatefulWidgetState<ForgetPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ForgetPasswordViewModel forgetPasswordViewModel =
      getIt.get<ForgetPasswordViewModel>();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgetPasswordViewModel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios, size: screenWidth  * 0.05),
                ),
                Text(
                  LocaleKeys.password.tr(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    LocaleKeys.forgetPassword.tr(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: screenWidth * 0.045, // roughly equivalent to 18.sp
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    LocaleKeys.emailVerificationRole.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  TextFormField(
                    validator: (value) {
                      return ValidateFunctions.getInstance().validationOfEmail(value);
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      enabled: true,
                      hintText: LocaleKeys.enterYourEmail.tr(),
                      labelText: LocaleKeys.email.tr(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  BlocConsumer<ForgetPasswordViewModel, PasswordState>(
                    builder: (context, state) {
                      if (state is PasswordLoadingState) {
                        return const LoadingWidget();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            forgetPasswordViewModel.onIntent(
                              ForgotPasswordIntent(emailController.text.trim()),
                            );
                          }
                        },
                        child: Text(LocaleKeys.confirm.tr()),
                      );
                    },
                    listener: (context, state) {
                      if (state is PasswordSuccessState) {
                        displayAlertDialog(
                          title: const Text('Otp-Code-send'),
                          showOkButton: true,
                          onOkButtonClick: () {
                            hideAlertDialog();
                            Navigator.pushNamed(
                              context,
                              DefinedRoutes.resetCodeScreenRoute,
                              arguments: emailController.text,
                            );
                          },
                        );
                      } else if (state is PasswordErrorState) {
                        ErrorStateWidget(error: state.error);
                      } else if (state is PasswordLoadingState) {
                        const LoadingWidget();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
