import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/register/register_request.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view_model/register_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view_model/register_state.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/loading_state_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseStatefulWidgetState<RegisterView> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneNumberController;
  late FocusNode firstNameFocusNode;
  late FocusNode lastNameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late FocusNode phoneNumberFocusNode;

  final GlobalKey<FormState> _formKey = GlobalKey();
  String selectedGender = 'female';

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    phoneNumberFocusNode.dispose();
  }

  var cubit = getIt<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusKeyboard(),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          titleSpacing: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text(
            LocaleKeys.signUp.tr(),
            style: theme.textTheme.labelMedium,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocProvider(
              create: (context) => cubit,
              child: BlocListener<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  switch (state.state) {
                    case RegisterStatus.initial:
                      break;
                    case RegisterStatus.loading:
                      unFocusKeyboard();
                      FocusManager.instance.primaryFocus?.unfocus();
                      displayAlertDialog(title: const LoadingWidget());
                    case RegisterStatus.success:
                      hideAlertDialog();
                      displayAlertDialog(
                        showOkButton: true,
                        title: Text(LocaleKeys.registeredSuccessfully.tr()),
                      );
                    case RegisterStatus.error:
                      hideAlertDialog();
                      displayAlertDialog(
                        showOkButton: true,
                        title: ErrorStateWidget(
                          error: state.error!,
                        ),
                      );
                  }
                },
                listenWhen: (previous, current) =>
                    current !=
                    RegisterState(
                      state: RegisterStatus.initial,
                    ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: firstNameController,
                              validator: (inputText) {
                                return validateFunctions
                                    .validationOfFirstOrLastName(inputText);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              focusNode: firstNameFocusNode,
                              onFieldSubmitted: (value) =>
                                  lastNameFocusNode.requestFocus(),
                              decoration: InputDecoration(
                                labelText: LocaleKeys.firstName.tr(),
                                hintText: LocaleKeys.pleaseEnterFirstName.tr(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: lastNameController,
                              validator: (inputText) {
                                return validateFunctions
                                    .validationOfFirstOrLastName(inputText);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              focusNode: lastNameFocusNode,
                              onFieldSubmitted: (value) =>
                                  emailFocusNode.requestFocus(),
                              decoration: InputDecoration(
                                labelText: LocaleKeys.lastName.tr(),
                                hintText: LocaleKeys.pleaseEnterLastName.tr(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (inputText) {
                          return validateFunctions.validationOfEmail(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        onFieldSubmitted: (value) =>
                            passwordFocusNode.requestFocus(),
                        decoration: InputDecoration(
                          labelText: LocaleKeys.email.tr(),
                          hintText: LocaleKeys.pleaseEnterEmail.tr(),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: passwordController,
                              validator: (inputText) {
                                return validateFunctions
                                    .validationOfPassword(inputText);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                              focusNode: passwordFocusNode,
                              onFieldSubmitted: (value) =>
                                  confirmPasswordFocusNode.requestFocus(),
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: LocaleKeys.password.tr(),
                                hintText: LocaleKeys.pleaseEnterPassword.tr(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: confirmPasswordController,
                              obscureText: true,
                              validator: (inputText) {
                                return validateFunctions
                                    .validationOfConfirmPassword(
                                        inputText, passwordController.text);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                              focusNode: confirmPasswordFocusNode,
                              onFieldSubmitted: (value) =>
                                  phoneNumberFocusNode.requestFocus(),
                              decoration: InputDecoration(
                                labelText: LocaleKeys.confirmPassword.tr(),
                                hintText: LocaleKeys.confirmPassword.tr(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      TextFormField(
                        controller: phoneNumberController,
                        validator: (inputText) {
                          return validateFunctions
                              .validationOfPhoneNumber(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        focusNode: phoneNumberFocusNode,
                        onFieldSubmitted: (value) =>
                            phoneNumberFocusNode.unfocus(),
                        decoration: InputDecoration(
                          labelText: LocaleKeys.phoneNumber.tr(),
                          hintText: LocaleKeys.pleaseEnterPhoneNumber.tr(),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.gender.tr(),
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontSize: 18,
                              color: AppColors.white[90],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<String>(
                                    hoverColor: AppColors.transparent,
                                    title: Text(
                                      'Female',
                                      style:
                                          theme.textTheme.labelSmall?.copyWith(
                                        color: selectedGender == 'female'
                                            ? AppColors.black
                                            : AppColors.white[90],
                                      ),
                                    ),
                                    value: 'female',
                                    groupValue: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender =
                                            value ?? selectedGender;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Male',
                                      style:
                                          theme.textTheme.labelSmall?.copyWith(
                                        color: selectedGender == 'male'
                                            ? AppColors.black
                                            : AppColors.white[90],
                                      ),
                                    ),
                                    value: 'male',
                                    groupValue: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender =
                                            value ?? selectedGender;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: LocaleKeys.agreeToTerms.tr(),
                                style: theme.textTheme.labelSmall!.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: Text(
                                  ' ${LocaleKeys.terms.tr()} & ${LocaleKeys.conditions.tr()}',
                                  style: theme.textTheme.labelSmall!.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.06,
                      ),
                      SizedBox(
                        height: screenHeight * 0.06,
                        child: FilledButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            cubit.doIntent(
                              OnSignUpClick(
                                RegisterRequest(
                                  rePassword: confirmPasswordController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: '+2${phoneNumberController.text}',
                                  gender: selectedGender,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            LocaleKeys.signUp.tr(),
                            style: theme.textTheme.labelSmall?.copyWith(
                                fontSize: 16, color: AppColors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: LocaleKeys.alreadyHaveAnAccount.tr(),
                                style: theme.textTheme.labelSmall!.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: InkWell(
                                  onTap: () {
                                    /// navigate to login
                                  },
                                  child: Text(
                                    LocaleKeys.login,
                                    style: theme.textTheme.labelSmall!.copyWith(
                                      fontSize: 16,
                                      color: AppColors.mainColor,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.mainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void unFocusKeyboard() {
    FocusScope.of(context).unfocus();
  }
}
