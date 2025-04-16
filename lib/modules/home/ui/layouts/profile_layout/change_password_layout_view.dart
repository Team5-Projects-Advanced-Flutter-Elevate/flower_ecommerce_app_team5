import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_state.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/widgets/error_state_widget.dart';
import '../../../../../core/widgets/loading_state_widget.dart';

class ChangePasswordLayoutView extends StatefulWidget {
  const ChangePasswordLayoutView({super.key});

  @override
  State<ChangePasswordLayoutView> createState() =>
      _ChangePasswordLayoutViewState();
}

class _ChangePasswordLayoutViewState
    extends BaseStatefulWidgetState<ChangePasswordLayoutView> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ProfileViewModelCubit viewModel = getIt.get<ProfileViewModelCubit>();
  bool isEnabled = false;
  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
          child: BlocListener<ProfileViewModelCubit, ProfileState>(
            bloc: viewModel,
            listener: (context, state) {
              switch (state) {
                case ProfileInitial():
                case ProfileDataSuccess():
                case ProfileEnableChangePasswordButton():
                  break;
                case ProfileLoading():
                  displayAlertDialog(title: const LoadingWidget());
                  break;
                case ProfileSuccess():
                  hideAlertDialog();
                  displayAlertDialog(
                    showOkButton: true,
                    title: const Text('Profile updated successfully'),
                  );
                case ProfileError():
                  hideAlertDialog();
                  displayAlertDialog(
                    showOkButton: true,
                    title: ErrorStateWidget(
                      error: state.error,
                    ),
                  );
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Current Password Field
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _currentPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText:
                          LocaleKeys.changePasswordCurrentPasswordLabel.tr(),
                      hintText:
                          LocaleKeys.changePasswordCurrentPasswordHint.tr(),
                    ),
                    validator:
                        ValidateFunctions.getInstance().validationOfPassword,
                    onChanged: (value) {
                      //ValidateFunctions.getInstance().validationOfPassword(value);
                    },
                  ),
                  const SizedBox(height: 20),

                  // New Password Field
                  TextFormField(
                      controller: _newPasswordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText:
                            LocaleKeys.changePasswordNewPasswordLabel.tr(),
                        hintText: LocaleKeys.changePasswordNewPasswordHint.tr(),
                      ),
                      validator:
                          ValidateFunctions.getInstance().validationOfPassword,
                      onChanged: (value) {
                        viewModel.changeButtonState(_newPasswordController.text,
                            _confirmPasswordController.text);
                      }),
                  const SizedBox(height: 20),

                  // Confirm Password Field
                  BlocListener<ProfileViewModelCubit, ProfileState>(
                    listener: (context, state) {
                      if (state is ProfileEnableChangePasswordButton) {
                        isEnabled = true;
                      }
                    },
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText:
                            LocaleKeys.changePasswordConfirmPasswordLabel.tr(),
                        hintText:
                            LocaleKeys.changePasswordConfirmPasswordHint.tr(),
                      ),
                      validator: (value) {
                        if (value != _newPasswordController.text) {
                          return 'Passwords do not match';
                        }

                        return ValidateFunctions.getInstance()
                            .validationOfPassword(value);
                      },
                      onChanged: (value) {
                        viewModel.changeButtonState(
                            value, _newPasswordController.text);
                      },
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Update Button
                  SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<ProfileViewModelCubit, ProfileState>(
                        bloc: viewModel,
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: isEnabled
                                ? () {
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
    );
  }
}
