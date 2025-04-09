import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/routing/defined_routes.dart';
import '../../../../../core/widgets/error_state_widget.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../view_model/forget_password_screen_view_model.dart';
import '../view_model/forget_password_state.dart';
import 'forget_password_screen.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/timer.dart';

class ResetCodeScreen extends StatefulWidget {
  const ResetCodeScreen({super.key});

  @override
  State<ResetCodeScreen> createState() => _ResetCodeScreenState();
}

class _ResetCodeScreenState extends BaseStatefulWidgetState<ResetCodeScreen> {
  bool sent = true;
  bool resend = false;
  final ValueNotifier<bool> _isLessThan5Minutes = ValueNotifier<bool>(false);
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
            forceMaterialTransparency: true,
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
                      width: 300.w,
                      otpFieldStyle: OtpFieldStyle(errorBorderColor: Colors.red),
                      style: TextStyle(fontSize: 17.sp),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onChanged: (value) {
                        // if (value == null || value.length != value) {
                        //   Fluttertoast.showToast(
                        //       msg: "Please enter a valid $value-digit OTP",
                        //       toastLength: Toast.LENGTH_SHORT,
                        //       gravity: ToastGravity.BOTTOM,
                        //       timeInSecForIosWeb: 1,
                        //       backgroundColor: Colors.green,
                        //       textColor: Colors.white,
                        //       fontSize: 16.0.sp);
                        //   return;
                        // }
                        // Fluttertoast.showToast(
                        //     msg: "OTP Verified: $value",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.BOTTOM,
                        //     timeInSecForIosWeb: 1,
                        //     backgroundColor: Colors.green,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0.sp);
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
                      resend == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Timer(
                                  isLessThan5Minutes: _isLessThan5Minutes,
                                  examDuration: 30,
                                  onTimeEnd: () {
                                    setState(() {
                                      resend = true;
                                    });
                                  },
                                )
                              ],
                            )
                          : InkWell(
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
                                          decorationColor:
                                              AppColors.mainColor))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) {
          if (state is PasswordSuccessState) {
            displayAlertDialog(title: const Text('valid otp'),showOkButton: true,onOkButtonClick: () {
              hideAlertDialog();
              Navigator.pushNamed(context, DefinedRoutes.resetPasswordScreenRoute, arguments: emailController.text);
            },);
          } else if (state is PasswordErrorState) {
            ErrorStateWidget(error: state.error);
          } else if (state is PasswordLoadingState) {
            const LoadingWidget();
          }
        },
      ),
    );
  }
}
