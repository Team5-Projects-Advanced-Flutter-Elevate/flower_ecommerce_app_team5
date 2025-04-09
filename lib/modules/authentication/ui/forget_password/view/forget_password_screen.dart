import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Icon(Icons.arrow_back_ios, size: 20.r)),
              Text(
                LocaleKeys.password.tr(),
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  LocaleKeys.forgetPassword.tr(),
                  style:
                      Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 18.sp
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(LocaleKeys.emailVerificationRole.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey
                    ),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 32.h,
                ),
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
                SizedBox(
                  height: 48.h,
                ),
                BlocConsumer<ForgetPasswordViewModel, PasswordState>(
                    builder: (context, state) {
                  if (state is PasswordLoadingState) {
                    return const LoadingWidget();
                  }
                  return ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                             forgetPasswordViewModel.onIntent(ForgotPasswordIntent(emailController.text.trim()));
                        }
                      },
                      child: Text(LocaleKeys.confirm.tr()));
                }, listener: (context, state) {
                  if (state is EmailSuccessState) {
                    displayAlertDialog(title: const Text('Otp-Code-send'),showOkButton: true,onOkButtonClick: () {
                      hideAlertDialog();
                      Navigator.pushNamed(context, DefinedRoutes.resetCodeScreenRoute, arguments: emailController.text);
                    },);
                  } else if (state is PasswordErrorState) {
                    ErrorStateWidget(error: state.error);
                  } else if (state is PasswordLoadingState) {
                    const LoadingWidget();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
