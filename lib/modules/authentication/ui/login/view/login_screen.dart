import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/implementation/flutter_secure_storage_service_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../../../../../shared_layers/storage/constants/storage_constants.dart';
import '../../../../../shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart';
import '../view_model/login_screen_view_model.dart';
import '../view_model/login_state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends BaseStatefulWidgetState<Login> {
  //late final SecureStorageService secureStorageService;
  LoginViewModel ViewModel = getIt.get<LoginViewModel>();
  SecureStorageService secureStorageService =
      getIt<SecureStorageService>(); // Initialize here
  @override
  Future<void> displayAlertDialog(
      {required Widget title,
      bool showOkButton = false,
      bool showConfirmButton = false,
      bool isDismissible = false,
      VoidFunction? onOkButtonClick,
      VoidFunction? onConfirmButtonClick}) {
    // TODO: implement displayAlertDialog
    return super.displayAlertDialog(
        title: title,
        showOkButton: showOkButton,
        showConfirmButton: showConfirmButton,
        isDismissible: isDismissible,
        onOkButtonClick: onOkButtonClick,
        onConfirmButtonClick: onConfirmButtonClick);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewModel,
      child: BlocConsumer<LoginViewModel, loginAuth>(
        listener: (context, state) {
          if (state is LoginLoading) {
            print('Loading...........');
          } else if (state is LoginFailure) {
            print('Fail...............${state.error}');
          } else if (state is IsGuestSuccess) {
            print('Sucess ......');
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: false),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.gray,
                          padding: EdgeInsets.all(14),
                          backgroundColor: AppColors.white,
                          //disabledBackgroundColor: AppColors.mainColor.shade100,
                          // disabledForegroundColor: AppColors.gray,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide(
                                color: AppColors.gray,
                              )),

                          textStyle: theme.textTheme.headlineMedium!.copyWith(
                            fontSize: 16,
                            color: AppColors.gray,
                          ),
                        ),
                        onPressed: () {
                          ViewModel.onIntent(LoginAsGuestIntent());
                        },
                        child: Text(
                          LocaleKeys.guestLogin.tr(),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          getData();
                        },
                        child: const Text(
                          'Done ...',
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<String?> getData() async {
    var p =
        await secureStorageService.getStringValue(StorageConstants.isGuestKey);
    print('result:$p');
    if (p == 'true') {
      displayAlertDialog(
        title: Text(LocaleKeys.checkGuest.tr()),
        showOkButton: true,
        isDismissible: false,
        onOkButtonClick: () {
          Navigator.pop(context);
        },
      );
    }
    return await secureStorageService
        .getStringValue(StorageConstants.isGuestKey);
  }
}
