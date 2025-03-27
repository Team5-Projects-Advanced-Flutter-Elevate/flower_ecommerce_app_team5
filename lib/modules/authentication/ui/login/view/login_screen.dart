import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/login/view_model/login_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/widgets/loading_state_widget.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  BaseStatefulWidgetState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulWidgetState<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var viewModel = getIt.get<LoginViewModelCubit>();
  @override
  initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _emailFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          LocaleKeys.login.tr(),
          style: GoogleFonts.inter(textStyle: theme.textTheme.headlineMedium),
        ),
        leading: ModalRoute.of(context)?.isFirst == true
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
      body: Form(
        key: _formKey,
        child: BlocListener<LoginViewModelCubit, LoginViewModelState>(
          bloc: viewModel,
          listenWhen: (previous, current) {
            return previous != current;
          },
          listener: (context, state) {
            if (state is LoginViewModelSuccess) {
              hideAlertDialog();
              displayAlertDialog(
                  showOkButton: true, title: const Text('LoginSuccess'));
            } else if (state is LoginViewModelError) {
              hideAlertDialog();
              displayAlertDialog(
                  showOkButton: true, title: ErrorWidget(state.error));
            } else if (state is LoginViewModelLoading) {
              displayAlertDialog(title: const LoadingWidget());
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  focusNode: _emailFocusNode,
                  controller: _emailController,
                  onFieldSubmitted: (value) =>
                      _passwordFocusNode.requestFocus(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ValidateFunctions.getInstance().validationOfEmail,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.pleaseEnterEmail.tr(),
                    labelText: LocaleKeys.email.tr(),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
                child: BlocBuilder<LoginViewModelCubit, LoginViewModelState>(
                    bloc: viewModel,
                    builder: (context, state) {
                      return TextFormField(
                        focusNode: _passwordFocusNode,
                        controller: _passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: ValidateFunctions.getInstance()
                            .validationOfPassword,
                        obscureText: viewModel.obscurePassword,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          hintText: LocaleKeys.pleaseEnterPassword.tr(),
                          labelText: LocaleKeys.password.tr(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              viewModel.processIntent(ShowPasswordIntent());
                            },
                            icon: Icon(
                              viewModel.obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0, right: 16.0, left: 16.0),
                child: Row(
                  children: [
                    BlocBuilder<LoginViewModelCubit, LoginViewModelState>(
                        bloc: viewModel,
                        builder: (context, state) {
                          return Checkbox(
                              activeColor: AppColors.mainColor,
                              value: viewModel.checkBoxValue,
                              onChanged: (value) {
                                viewModel.processIntent(RememberMeIntent());
                              });
                        }),
                    Text(
                      LocaleKeys.rememberMe.tr(),
                      style: GoogleFonts.inter(
                          textStyle: theme.textTheme.bodyMedium),
                    ),
                    const Spacer(),
                    Text(
                      LocaleKeys.forgetPassword.tr(),
                      style: GoogleFonts.inter(
                        textStyle: theme.textTheme.bodyMedium!,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          viewModel.processIntent(LoginIntent(
                              loginInputModel: LoginInputModel(
                                  email: _emailController.text,
                                  password: _passwordController.text)));
                        },
                        child: Text(
                          LocaleKeys.login.tr(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(LocaleKeys.dontHaveAccount.tr(),
                      style: GoogleFonts.inter(
                          textStyle: theme.textTheme.bodyLarge)),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        LocaleKeys.signUp.tr(),
                        style: GoogleFonts.inter(
                          textStyle: theme.textTheme.bodyLarge!,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.mainColor,
                        ).copyWith(color: AppColors.mainColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
