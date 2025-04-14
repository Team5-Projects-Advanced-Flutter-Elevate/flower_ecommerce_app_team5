import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordLayoutView extends StatefulWidget {
  const ChangePasswordLayoutView({super.key});

  @override
  State<ChangePasswordLayoutView> createState() =>
      _ChangePasswordLayoutViewState();
}

class _ChangePasswordLayoutViewState extends State<ChangePasswordLayoutView> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Form(
          child: Column(
            children: [
              // Current Password Field
              TextFormField(
                controller: _currentPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: LocaleKeys.changePasswordCurrentPasswordLabel.tr(),
                  hintText: LocaleKeys.changePasswordCurrentPasswordHint.tr(),
                ),
                validator: ValidateFunctions.getInstance().validationOfPassword,
                onChanged: (value) {
                  setState(() {
                    _isButtonEnabled =
                        _currentPasswordController.text.isNotEmpty &&
                            _newPasswordController.text ==
                                _confirmPasswordController.text;
                  });
                },
              ),
              const SizedBox(height: 20),

              // New Password Field
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: LocaleKeys.changePasswordNewPasswordLabel.tr(),
                  hintText: LocaleKeys.changePasswordNewPasswordHint.tr(),
                ),
                validator: ValidateFunctions.getInstance().validationOfPassword,
                onChanged: (value) {
                  setState(() {
                    _isButtonEnabled =
                        _currentPasswordController.text.isNotEmpty &&
                            _newPasswordController.text.isNotEmpty &&
                            _confirmPasswordController.text.isNotEmpty;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Confirm Password Field
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: LocaleKeys.changePasswordConfirmPasswordLabel.tr(),
                  hintText: LocaleKeys.changePasswordConfirmPasswordHint.tr(),
                ),
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return ValidateFunctions.getInstance()
                      .validationOfPassword(value);
                },
                onChanged: (value) {
                  setState(() {
                    _isButtonEnabled =
                        _currentPasswordController.text.isNotEmpty &&
                            _newPasswordController.text.isNotEmpty &&
                            _confirmPasswordController.text.isNotEmpty;
                  });
                },
              ),
              const SizedBox(height: 40),

              // Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          if (Form.of(context).validate()) {
                            // Handle password change logic
                          }
                        }
                      : null,
                  child: Text(LocaleKeys.changePasswordUpdateButton.tr()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
