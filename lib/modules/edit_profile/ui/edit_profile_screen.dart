import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/constants/constants.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/cached_image.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/user_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/edit_profile_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/ui/view_model/edit_profile_state.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/ui/view_model/edit_profile_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utilities/extensions/gender_ex.dart';
import '../../../../../core/utilities/image_picker/image_picker_service.dart';
import '../../../../../core/widgets/loading_state_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState
    extends BaseStatefulWidgetState<EditProfileScreen> {
  final cubit = getIt<EditProfileViewModelCubit>();

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
  String selectedGender = Gender.values.first.getValue();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController(text: '123456789');
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
    cubit.processIntent(LoadProfileIntent());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
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

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop<bool>(context, cubit.didProfileChanged);
    return true;
  }

  // I made the viewModel to call this function when it successfully get Profile data
  // because when these controllers gets updated by the view with any build happen they return back to the previous values
  void updateEditProfileControllers(UserDto? user) {
    firstNameController.text = user?.firstName ?? "";
    lastNameController.text = user?.lastName ?? "";
    emailController.text = user?.email ?? "";
    phoneNumberController.text = user?.phone ?? "";
    selectedGender = user?.gender == null
        ? ""
        : user?.gender == 'male'
            ? Gender.male.getValue()
            : Gender.female.getValue();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          titleSpacing: 0.0,
          leading: IconButton(
            onPressed: () =>
                Navigator.pop<bool>(context, cubit.didProfileChanged),
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocProvider(
            create: (context) => cubit,
            child: BlocConsumer<EditProfileViewModelCubit, EditProfileState>(
              listenWhen: (previous, current) {
                if (previous.updateProfileStatus !=
                    current.updateProfileStatus) {
                  return true;
                }
                return false;
              },
              listener: (context, state) {
                switch (state.updateProfileStatus) {
                  case EditProfileStatus.initial:
                    break;
                  case EditProfileStatus.loading:
                    displayAlertDialog(title: const LoadingWidget());
                  case EditProfileStatus.success:
                    hideAlertDialog();
                    displayAlertDialog(
                        title: Text(LocaleKeys.profileUpdatedSuccessfully.tr()),
                        showOkButton: true);
                  case EditProfileStatus.error:
                    hideAlertDialog();
                    displayAlertDialog(
                        title: ErrorStateWidget(error: state.error!),
                        showOkButton: true);
                }
              },
              builder: (context, state) {
                switch (state.getProfileDataStatus) {
                  case EditProfileStatus.initial:
                  case EditProfileStatus.loading:
                    return const LoadingWidget();
                  case EditProfileStatus.success:
                    bool isUserGuest =
                        state.userLoginStatus == UserLoginStatus.guest;
                    if (cubit.updateControllers) {
                      updateEditProfileControllers(state.user);
                      cubit.updateControllers = false;
                    }
                    return SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: isUserGuest
                                    ? () => handleUserIsGuest()
                                    : () => ImagePickerService()
                                            .showImageSourceDialog(
                                          context,
                                          onImageSelected: (image) {
                                            cubit.processIntent(
                                                LoadProfileImageIntent(image));
                                          },
                                        ),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    BlocConsumer<EditProfileViewModelCubit,
                                            EditProfileState>(
                                        listenWhen: (previous, current) {
                                      if (previous.uploadImageStatus !=
                                          current.uploadImageStatus) {
                                        return true;
                                      }
                                      return false;
                                    }, listener: (context, state) {
                                      switch (state.uploadImageStatus) {
                                        case EditProfileStatus.initial:
                                          break;
                                        case EditProfileStatus.loading:
                                          displayAlertDialog(
                                              title: const LoadingWidget());
                                        case EditProfileStatus.success:
                                          hideAlertDialog();
                                          break;
                                        case EditProfileStatus.error:
                                          hideAlertDialog();
                                          displayAlertDialog(
                                            showOkButton: true,
                                            title: ErrorStateWidget(
                                              error: state.error!,
                                            ),
                                          );
                                      }
                                    }, buildWhen: (previous, current) {
                                      if (previous.uploadImageStatus !=
                                              current.uploadImageStatus &&
                                          current.uploadImageStatus ==
                                              EditProfileStatus.success) {
                                        return true;
                                      }
                                      return false;
                                    }, builder: (context, state) {
                                      return CircleAvatar(
                                        radius: 40 *
                                            (screenWidth /
                                                Constants.designWidth),
                                        child: state.profilePhotoLink == null
                                            ? const Icon(Icons.person)
                                            : ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(360)),
                                                child: CachedImage(
                                                  fit: BoxFit.cover,
                                                  url: state.profilePhotoLink!,
                                                  width: double.maxFinite,
                                                ),
                                              ),
                                      );
                                    }),
                                    Container(
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.lightPink,
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: AppColors.gray,
                                        size: 18 *
                                            (screenWidth /
                                                Constants.designWidth),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                    onFieldSubmitted: (_) =>
                                        FocusScope.of(context)
                                            .requestFocus(lastNameFocusNode),
                                    enabled: !isUserGuest,
                                    decoration: InputDecoration(
                                      labelText: LocaleKeys.firstName.tr(),
                                      hintText:
                                          LocaleKeys.pleaseEnterFirstName.tr(),
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
                                    onFieldSubmitted: (_) =>
                                        FocusScope.of(context)
                                            .requestFocus(emailFocusNode),
                                    enabled: !isUserGuest,
                                    decoration: InputDecoration(
                                      labelText: LocaleKeys.lastName.tr(),
                                      hintText:
                                          LocaleKeys.pleaseEnterLastName.tr(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            TextFormField(
                              controller: emailController,
                              validator: (inputText) => validateFunctions
                                  .validationOfEmail(inputText),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              focusNode: emailFocusNode,
                              onTap: () => FocusScope.of(context)
                                  .requestFocus(emailFocusNode),
                              enabled: !isUserGuest,
                              decoration: InputDecoration(
                                labelText: LocaleKeys.email.tr(),
                                hintText: LocaleKeys.pleaseEnterEmail.tr(),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            TextFormField(
                              controller: phoneNumberController,
                              validator: (inputText) => validateFunctions
                                  .validationOfPhoneNumber(inputText),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.phone,
                              focusNode: phoneNumberFocusNode,
                              onTap: () => FocusScope.of(context)
                                  .requestFocus(phoneNumberFocusNode),
                              enabled: !isUserGuest,
                              decoration: InputDecoration(
                                labelText: LocaleKeys.phoneNumber.tr(),
                                hintText:
                                    LocaleKeys.pleaseEnterPhoneNumber.tr(),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            TextFormField(
                              readOnly: true,
                              controller: passwordController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                              obscuringCharacter: '*',
                              obscureText: true,
                              enabled: !isUserGuest,
                              decoration: InputDecoration(
                                suffix: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context,
                                        DefinedRoutes
                                            .changePasswordScreenRoute);
                                  },
                                  child: Text(
                                    LocaleKeys.change.tr(),
                                    style: GoogleFonts.inter(
                                      textStyle: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                              color: AppColors.mainColor),
                                    ),
                                  ),
                                ),
                                labelText: LocaleKeys.password.tr(),
                                hintText: LocaleKeys.pleaseEnterPassword.tr(),
                              ),
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
                                          selected: false,
                                          contentPadding: EdgeInsets.zero,
                                          hoverColor: AppColors.transparent,
                                          title: Text(
                                            LocaleKeys.genderFemale.tr(),
                                            style: theme.textTheme.labelSmall
                                                ?.copyWith(
                                              color: selectedGender ==
                                                      Gender.female.getValue()
                                                  ? AppColors.black
                                                  : AppColors.white[90],
                                            ),
                                          ),
                                          value: Gender.female.getValue(),
                                          groupValue: selectedGender,
                                          onChanged: (String? value) {},
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile<String>(
                                          selected: true,
                                          contentPadding: EdgeInsets.zero,
                                          title: Text(
                                            LocaleKeys.genderMale.tr(),
                                            style: theme.textTheme.labelSmall
                                                ?.copyWith(
                                              color: selectedGender ==
                                                      Gender.male.getValue()
                                                  ? AppColors.black
                                                  : AppColors.white[90],
                                            ),
                                          ),
                                          value: Gender.male.getValue(),
                                          groupValue: selectedGender,
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            FilledButton(
                              onPressed: isUserGuest
                                  ? null
                                  : () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        cubit.processIntent(EditProfileIntent(
                                            EditProfileInputModel(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          phone: phoneNumberController.text,
                                          email: emailController.text,
                                        )));
                                      }
                                    },
                              child: Text(
                                LocaleKeys.update.tr(),
                                style: theme.textTheme.labelSmall?.copyWith(
                                    fontSize: 16, color: AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  case EditProfileStatus.error:
                    return Center(child: ErrorStateWidget(error: state.error!));
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void handleUserIsGuest() {
    displayAlertDialog(
      title: Text(
        LocaleKeys.pleaseLoginFirst.tr(),
      ),
      showOkButton: true,
      onOkButtonClick: () {
        Navigator.pushReplacementNamed(
          context,
          DefinedRoutes.loginScreenRoute,
        );
      },
    );
  }
}
