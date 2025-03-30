import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../../../core/routing/defined_routes.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../view_model/forget_password_screen_view_model.dart';
import '../view_model/forget_password_state.dart';
import 'forget_password_screen.dart';

class ResetCodeScreen extends StatelessWidget {
  bool sent = true;
  ResetCodeScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  ForgetPasswordViewModel forgetPasswordViewModel =
      getIt.get<ForgetPasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgetPasswordViewModel,
      child: BlocConsumer<ForgetPasswordViewModel, PasswordState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                InkWell(
                    onTap: () {
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    LocaleKeys.emailVerification.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(LocaleKeys.emailVerificationText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.grey)),
                  SizedBox(
                    height: 32.h,
                  ),
                  Center(
                    child: OTPTextField(
                      length: 6,
                      width: 344.w,
                      style: TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onChanged: (value) {
                        if (value == null || value.length != value) {
                          Fluttertoast.showToast(
                              msg: "Please enter a valid $value-digit OTP",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0.sp);
                          return;
                        }
                        Fluttertoast.showToast(
                            msg: "OTP Verified: $value",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0.sp);
                      },
                      onCompleted: (code) {
                        forgetPasswordViewModel.onIntent(ResetCodeIntent(code));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.dontReceive,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      InkWell(
                          onTap: () {
                            forgetPasswordViewModel.onIntent(
                                ForgotPasswordIntent(emailController.text));
                          },
                          child: Text(LocaleKeys.resend,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: AppColors.mainColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.mainColor))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) {
          if (state is PasswordSuccessState) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0.sp);
            Navigator.pushNamed(context, DefinedRoutes.resetPasswordScreenRoute,
                arguments: emailController.text);
          } else if (state is PasswordErrorState) {
            ErrorWidget(state.error);
          } else if (state is PasswordLoadingState) {
            LoadingWidget();
          }
        },
      ),
    );
  }
}
