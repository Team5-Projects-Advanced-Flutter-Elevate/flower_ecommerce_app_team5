import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view/forget_password_screen.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../core/routing/defined_routes.dart';
import '../../../../../core/validation/validation_functions.dart';
import '../../../../../core/widgets/loading_state_widget.dart';
import '../view_model/forget_password_screen_view_model.dart';
import '../view_model/forget_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}
late TextEditingController newPasswordController;
late TextEditingController confirmPasswordController;
GlobalKey<FormState> formKey = GlobalKey<FormState>();
class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ForgetPasswordViewModel forgetPasswordViewModel = getIt.get<ForgetPasswordViewModel>();
    return BlocProvider(
      create: (context) => forgetPasswordViewModel,
      child: BlocConsumer<ForgetPasswordViewModel,PasswordState>(
        builder: (context, state) =>  Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(children: [InkWell(
              onTap: () {
                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back_ios,size: 20.sp)),Text(LocaleKeys.password.tr(),style: Theme.of(context).textTheme.labelMedium)],),),
          body: Form(
            key: formKey,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40.h,),
                  Text(LocaleKeys.resetPassword.tr(),style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 18.sp
                  ),textAlign: TextAlign.center,),
                  SizedBox(height: 16.h,),
                  Text(LocaleKeys.passwordVerificationRole.tr(),style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey
                  ),textAlign: TextAlign.center,),
                  SizedBox(height: 32.h,),
                  TextFormField(
                    validator: (value) {
                      ValidateFunctions.getInstance().validationOfPassword(value);
                    },
                    controller: newPasswordController,
                    decoration: InputDecoration(
                      enabled: true,
                      hintText: LocaleKeys.enterYourPassword,
                      labelText: LocaleKeys.newPassword.tr(),
                    ),
                  ),
                  SizedBox(height: 24.h,),
                  TextFormField(
                    validator: (value) {
                      ValidateFunctions.getInstance().validationOfConfirmPassword(value, newPasswordController.text);
                    },
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      enabled: true,
                      hintText: LocaleKeys.confirmPassword,
                      labelText: LocaleKeys.confirmPassword,
                    ),
                  ),
                  SizedBox(height: 48.h,),
                  ElevatedButton(onPressed: () {
                    if(formKey.currentState!.validate()){
                      forgetPasswordViewModel.onIntent(ResetPasswordIntent(emailController.text, newPasswordController.text.trim()));
                    }
                  }, child: Text(LocaleKeys.confirm.tr()),
                      style: ButtonStyle(padding:WidgetStatePropertyAll(REdgeInsets.symmetric(vertical: 14),),))
                ],
              ),
            ),
          ),
        ) ,
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
            Navigator.pushNamed(context, DefinedRoutes.forgetPasswordScreenRoute);
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
