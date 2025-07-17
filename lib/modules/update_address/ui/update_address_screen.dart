import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/ui/view_model/update_address_state.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/ui/view_model/update_address_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/ui/widgets/custom_drop_down_menu.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAddressScreen extends StatefulWidget {
  final AddressEntity addressEntity;
  const UpdateAddressScreen({super.key, required this.addressEntity});

  @override
  State<UpdateAddressScreen> createState() => _UpdState();
}

class _UpdState extends BaseStatefulWidgetState<UpdateAddressScreen> {
  bool didAddressUpdated = false;
  final UpdateAddressViewModel updateAddressViewModel =
      getIt.get<UpdateAddressViewModel>();
  @override
  void initState() {
    super.initState();
    updateAddressViewModel
        .doIntent(InitializeData(addressEntity: widget.addressEntity));
    BackButtonInterceptor.add(myInterceptor);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo routeInfo) {
    Navigator.pop(context, didAddressUpdated);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => updateAddressViewModel,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            titleSpacing: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 20, color: Colors.black),
              onPressed: () => Navigator.pop(context, didAddressUpdated),
            ),
            title: Text(LocaleKeys.updateAddress.tr(),
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: BlocBuilder<UpdateAddressViewModel, UpdateAddressState>(
              builder: (context, state) {
                switch (state.initializingDataStatus) {
                  case Status.idle:
                    return const SizedBox();
                  case Status.loading:
                    return const LoadingWidget();
                  case Status.success:
                    return SingleChildScrollView(
                      child: Form(
                        key: updateAddressViewModel.formKey,
                        onChanged: () {
                          updateAddressViewModel
                              .doIntent(OnOneOfTheFieldsChange());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Image(
                                image: AssetImage('assets/icons/map.png')),
                            SizedBox(height: screenHeight * 0.02),
                            TextFormField(
                              controller:
                                  updateAddressViewModel.addressController,
                              decoration: InputDecoration(
                                  labelText: LocaleKeys.addressTitle.tr(),
                                  hintText: LocaleKeys.addressHint.tr()),
                              validator: validateFunctions.validationOfAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            TextFormField(
                              controller:
                                  updateAddressViewModel.phoneController,
                              decoration: InputDecoration(
                                  labelText: LocaleKeys.phoneNumber.tr(),
                                  hintText: LocaleKeys.phoneNumberHint.tr()),
                              validator:
                                  validateFunctions.validationOfPhoneNumber,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            TextFormField(
                              controller:
                                  updateAddressViewModel.recipientController,
                              decoration: InputDecoration(
                                  labelText: LocaleKeys.recipient.tr(),
                                  hintText: LocaleKeys.recipientNameHint.tr()),
                              validator:
                                  validateFunctions.validationOfrecipient,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomDropDownMenu(
                                    value: updateAddressViewModel
                                        .selectedGovernorate,
                                    items: updateAddressViewModel.governorates
                                        .map((e) => e.nameEn)
                                        .toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          updateAddressViewModel
                                              .selectedGovernorate = value;
                                          updateAddressViewModel
                                                  .selectedGovernorateId =
                                              updateAddressViewModel
                                                  .governorates
                                                  .firstWhere(
                                                      (g) => g.nameEn == value)
                                                  .id;
                                          updateAddressViewModel
                                                  .citiesOfSelectedGovernorate =
                                              updateAddressViewModel.allCities
                                                  .where((c) =>
                                                      c.governorateId ==
                                                      updateAddressViewModel
                                                          .selectedGovernorateId)
                                                  .toList();
                                          updateAddressViewModel.selectedCity =
                                              updateAddressViewModel
                                                      .citiesOfSelectedGovernorate
                                                      .isNotEmpty
                                                  ? updateAddressViewModel
                                                      .citiesOfSelectedGovernorate
                                                      .first
                                                      .cityNameEn
                                                  : "";
                                        });
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Expanded(
                                  child: CustomDropDownMenu(
                                    value: updateAddressViewModel.selectedCity,
                                    items: updateAddressViewModel
                                        .citiesOfSelectedGovernorate
                                        .map((c) => c.cityNameEn)
                                        .toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          updateAddressViewModel.selectedCity =
                                              value;
                                        });
                                        updateAddressViewModel
                                            .doIntent(OnOneOfTheFieldsChange());
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.04),
                            // ? const LoadingWidget()
                            ValueListenableBuilder(
                                valueListenable: updateAddressViewModel
                                    .isUpdateButtonEnabledNotifier,
                                builder: (context, isEnabled, child) {
                                  return ElevatedButton(
                                    onPressed: isEnabled
                                        ? () async {
                                            if (updateAddressViewModel
                                                    .formKey.currentState
                                                    ?.validate() !=
                                                true) {
                                              return;
                                            }
                                          }
                                        : null,
                                    child: Text(
                                      LocaleKeys.update.tr(),
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    );
                  case Status.error:
                    return ErrorStateWidget(
                        error: state.initializingDataError!);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    BackButtonInterceptor.remove(myInterceptor);
  }
}
