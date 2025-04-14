import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/constants/constants.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view_model/register_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view_model/register_state.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utilities/extensions/gender_ex.dart';
import '../../../../../core/widgets/loading_state_widget.dart';

class EditeProfileLayoutView extends StatefulWidget {
  const EditeProfileLayoutView({super.key});

  @override
  State<EditeProfileLayoutView> createState() => _EditeProfileLayoutViewState();
}

class _EditeProfileLayoutViewState
    extends BaseStatefulWidgetState<EditeProfileLayoutView> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late FocusNode firstNameFocusNode;
  late FocusNode lastNameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode phoneNumberFocusNode;

  final GlobalKey<FormState> _formKey = GlobalKey();
  String selectedGender = Gender.female.getValue();

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController(text: '123456');
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

  final cubit = getIt<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        titleSpacing: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          LocaleKeys.editProfile.tr(),
          style: theme.textTheme.labelMedium,
        ),
        actions: [
          Padding(
            padding:
                EdgeInsets.all(12.0 * (screenWidth / Constants.designWidth)),
            child: Badge(
              backgroundColor: AppColors.mainColor,
              label: Text('3',
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: AppColors.white)),
              child: Icon(Icons.notifications_none_outlined,
                  size: 24 * (screenWidth / Constants.designWidth)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                  current != RegisterState(state: RegisterStatus.initial),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage(
                                  'assets/images/profile_test.jpg'),
                              radius:
                                  40 * (screenWidth / Constants.designWidth),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightPink,
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.gray,
                                size:
                                    18 * (screenWidth / Constants.designWidth),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: firstNameController,
                            validator: (inputText) => validateFunctions
                                .validationOfFirstOrLastName(inputText),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            focusNode: firstNameFocusNode,
                            onTap: () => FocusScope.of(context)
                                .requestFocus(firstNameFocusNode),
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(lastNameFocusNode),
                            decoration: InputDecoration(
                              labelText: LocaleKeys.firstName.tr(),
                              hintText: LocaleKeys.pleaseEnterFirstName.tr(),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        Expanded(
                          child: TextFormField(
                            controller: lastNameController,
                            validator: (inputText) => validateFunctions
                                .validationOfFirstOrLastName(inputText),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            focusNode: lastNameFocusNode,
                            onTap: () => FocusScope.of(context)
                                .requestFocus(lastNameFocusNode),
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(emailFocusNode),
                            decoration: InputDecoration(
                              labelText: LocaleKeys.lastName.tr(),
                              hintText: LocaleKeys.pleaseEnterLastName.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextFormField(
                      controller: emailController,
                      validator: (inputText) =>
                          validateFunctions.validationOfEmail(inputText),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      onTap: () =>
                          FocusScope.of(context).requestFocus(emailFocusNode),
                      decoration: InputDecoration(
                        labelText: LocaleKeys.email.tr(),
                        hintText: LocaleKeys.pleaseEnterEmail.tr(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextFormField(
                      controller: phoneNumberController,
                      validator: (inputText) =>
                          validateFunctions.validationOfPhoneNumber(inputText),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      focusNode: phoneNumberFocusNode,
                      onTap: () => FocusScope.of(context)
                          .requestFocus(phoneNumberFocusNode),
                      decoration: InputDecoration(
                        labelText: LocaleKeys.phoneNumber.tr(),
                        hintText: LocaleKeys.pleaseEnterPhoneNumber.tr(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Stack(
                      children: [
                        TextFormField(
                          readOnly: true,
                          controller: passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.visiblePassword,
                          obscuringCharacter: '*',
                          obscureText: true,
                          decoration: InputDecoration(
                            suffix: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    DefinedRoutes.changePasswordScreenRoute);
                              },
                              child: Text(
                                'Change ',
                                style: GoogleFonts.inter(
                                  textStyle: theme.textTheme.bodyMedium
                                      ?.copyWith(color: AppColors.mainColor),
                                ),
                              ),
                            ),
                            labelText: LocaleKeys.password.tr(),
                            hintText: LocaleKeys.pleaseEnterPassword.tr(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
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
                                  contentPadding: EdgeInsets.zero,
                                  hoverColor: AppColors.transparent,
                                  title: Text(
                                    LocaleKeys.genderFemale.tr(),
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: selectedGender ==
                                              Gender.female.getValue()
                                          ? AppColors.black
                                          : AppColors.white[90],
                                    ),
                                  ),
                                  value: Gender.female.getValue(),
                                  groupValue: selectedGender,
                                  onChanged: (value) => setState(() {
                                    selectedGender = value ?? selectedGender;
                                  }),
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    LocaleKeys.genderMale.tr(),
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: selectedGender ==
                                              Gender.male.getValue()
                                          ? AppColors.black
                                          : AppColors.white[90],
                                    ),
                                  ),
                                  value: Gender.male.getValue(),
                                  groupValue: selectedGender,
                                  onChanged: (value) => setState(() {
                                    selectedGender = value ?? selectedGender;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      height: screenHeight * 0.06,
                      child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle form submission
                          }
                        },
                        child: Text(
                          'Update',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(fontSize: 16, color: AppColors.white),
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
    );
  }
}
