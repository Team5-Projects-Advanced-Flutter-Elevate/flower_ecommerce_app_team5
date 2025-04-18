import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/ui/view_model/edit_profile_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/ui/view_model/edit_profile_state.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/error_state_widget.dart';
import '../../../core/widgets/loading_state_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends BaseStatefulWidgetState<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  EditProfileViewModelCubit viewModel = getIt.get<EditProfileViewModelCubit>();
  bool isEnabled = false;

  bool isCurrentPasswordObscure = true,
      isNewPasswordObscure = true,
      isConfirmPasswordObscure = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocProvider(
        create: (context) => viewModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.changePasswordTitle.tr(),
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocListener<EditProfileViewModelCubit, EditProfileState>(
              listener: (context, state) {
                switch (state.changePasswordStatus) {
                  case EditProfileStatus.initial:
                    break;
                  case EditProfileStatus.loading:
                    displayAlertDialog(title: const LoadingWidget());
                  case EditProfileStatus.success:
                    hideAlertDialog();
                    displayAlertDialog(
                        title: const Text("Password Changed Successfully!"),
                        showOkButton: true);
                  case EditProfileStatus.error:
                    hideAlertDialog();
                    displayAlertDialog(
                        title: ErrorStateWidget(error: state.error!),
                        showOkButton: true);
                }
              },
              child: Form(
                key: _formKey,
                onChanged: () {
                  viewModel
                      .changeButtonState(_formKey.currentState!.validate());
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Current Password Field
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _currentPasswordController,
                        obscureText: isCurrentPasswordObscure,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            labelText: LocaleKeys
                                .changePasswordCurrentPasswordLabel
                                .tr(),
                            hintText: LocaleKeys
                                .changePasswordCurrentPasswordHint
                                .tr(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isCurrentPasswordObscure =
                                      !isCurrentPasswordObscure;
                                });
                              },
                              icon: Icon(
                                isCurrentPasswordObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            )),
                        validator: ValidateFunctions.getInstance()
                            .validationOfPassword,
                      ),
                      const SizedBox(height: 20),

                      // New Password Field
                      TextFormField(
                        controller: _newPasswordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: isNewPasswordObscure,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            labelText:
                                LocaleKeys.changePasswordNewPasswordLabel.tr(),
                            hintText:
                                LocaleKeys.changePasswordNewPasswordHint.tr(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isNewPasswordObscure = !isNewPasswordObscure;
                                });
                              },
                              icon: Icon(
                                isNewPasswordObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            )),
                        validator: ValidateFunctions.getInstance()
                            .validationOfPassword,
                      ),
                      const SizedBox(height: 20),

                      // Confirm Password Field
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _confirmPasswordController,
                        obscureText: isConfirmPasswordObscure,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            labelText: LocaleKeys
                                .changePasswordConfirmPasswordLabel
                                .tr(),
                            hintText: LocaleKeys
                                .changePasswordConfirmPasswordHint
                                .tr(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordObscure =
                                      !isConfirmPasswordObscure;
                                });
                              },
                              icon: Icon(
                                isConfirmPasswordObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            )),
                        validator: (value) {
                          if (value != _newPasswordController.text) {
                            return 'Passwords do not match';
                          }

                          return ValidateFunctions.getInstance()
                              .validationOfPassword(value);
                        },
                      ),
                      const SizedBox(height: 40),

                      // Update Button
                      SizedBox(
                        width: double.infinity,
                        child: BlocBuilder<EditProfileViewModelCubit,
                            EditProfileState>(builder: (context, state) {
                          switch (state.changeButtonStatus) {
                            case ButtonStatus.enable:
                              isEnabled = true;
                            case ButtonStatus.disable:
                              isEnabled = false;
                          }
                          return ElevatedButton(
                            onPressed: isEnabled
                                ? () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (_formKey.currentState!.validate()) {
                                      viewModel.processIntent(
                                          ChangePasswordIntent(
                                              password:
                                                  _currentPasswordController
                                                      .text,
                                              newPassword:
                                                  _newPasswordController.text));
                                    }
                                  }
                                : null,
                            child: Text(
                                LocaleKeys.changePasswordUpdateButton.tr()),
                          );
                        }),
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
}
