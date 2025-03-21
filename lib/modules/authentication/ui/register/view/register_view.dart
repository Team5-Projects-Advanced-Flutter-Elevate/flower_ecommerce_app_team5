import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

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

  GlobalKey<FormState> _formKey = GlobalKey();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'Sign Up',
          style: theme.textTheme.labelMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        focusNode: firstNameFocusNode,
                        onFieldSubmitted: (value) =>
                            lastNameFocusNode.requestFocus(),
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          hintText: 'Enter first name',
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        focusNode: lastNameFocusNode,
                        onFieldSubmitted: (value) =>
                            emailFocusNode.requestFocus(),
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Enter last name',
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
                  onFieldSubmitted: (value) => passwordFocusNode.requestFocus(),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: passwordFocusNode,
                        onFieldSubmitted: (value) =>
                            confirmPasswordFocusNode.requestFocus(),
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'password',
                          hintText: 'Enter password',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: confirmPasswordController,
                        validator: (inputText) {
                          return validateFunctions.validationOfConfirmPassword(
                              inputText, passwordController.text);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: confirmPasswordFocusNode,
                        onFieldSubmitted: (value) =>
                            phoneNumberFocusNode.requestFocus(),
                        decoration: const InputDecoration(
                          labelText: 'Confirm password',
                          hintText: 'confirm password',
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
                    return validateFunctions.validationOfPhoneNumber(inputText);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  focusNode: phoneNumberFocusNode,
                  onFieldSubmitted: (value) => phoneNumberFocusNode.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                    hintText: 'Enter phone number',
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  children: [
                    Text(
                      'Gender',
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
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: selectedGender == 'female'
                                      ? AppColors.black
                                      : AppColors.white[90],
                                ),
                              ),
                              value: 'female',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value ?? selectedGender;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: Text(
                                'Male',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: selectedGender == 'male'
                                      ? AppColors.black
                                      : AppColors.white[90],
                                ),
                              ),
                              value: 'male',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value ?? selectedGender;
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
                          text: 'Creating an account you agree to our ',
                          style: theme.textTheme.labelSmall!.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: Text(
                            'Terms & Conditions',
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
                    },
                    child: Text(
                      'Sign up',
                      style: theme.textTheme.labelSmall
                          ?.copyWith(fontSize: 16, color: AppColors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account ? ',
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
                              'Login',
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
    );
  }
}
