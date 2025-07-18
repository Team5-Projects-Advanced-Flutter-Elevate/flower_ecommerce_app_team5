import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/profile_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/address_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/address_states.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/widget/curved_buttons.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import '../../../domain/entities/cities_states_entity/get_cities.dart';
import '../../../domain/entities/cities_states_entity/get_states.dart';

class UpdateAddressScreen extends StatefulWidget {
  AddressEntity? address;

  UpdateAddressScreen({super.key,});

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends BaseStatefulWidgetState<UpdateAddressScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController recipientController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<GetCities> governorates = [];
  List<City> allCities = [];
  List<City> filteredCities = [];
  String? selectedGovernorate;
  String? selectedGovernorateId;
  String? selectedArea;

  final AddressCubit viewModel = getIt.get<AddressCubit>();

  @override
  void initState() {
    super.initState();
    // Initialize form fields with existing address data
    addressController.text = widget.address?.street ?? '';
    phoneController.text = widget.address?.phone ?? '';
    recipientController.text = widget.address?.username ?? '';
    selectedGovernorate = widget.address?.city ?? '';
    selectedArea = widget.address?.city ?? '';

    // Load governorates and cities
    viewModel.loadGovernorates().then((value) {
      setState(() {
        governorates = value;
        selectedGovernorate = governorates.any((g) => g.nameEn == widget.address?.city)
            ? widget.address?.city
            : governorates.isNotEmpty
                ? governorates.first.nameEn
                : null;
        selectedGovernorateId = governorates.any((g) => g.nameEn == widget.address?.city)
            ? governorates.firstWhere((g) => g.nameEn == widget.address?.city).id
            : governorates.isNotEmpty
                ? governorates.first.id
                : null;
      });
      // Load cities after governorate is set
      viewModel.loadCities().then((value) {
        setState(() {
          allCities = value;
          filteredCities = allCities.where((c) => c.governorateId == selectedGovernorateId).toList();
          selectedArea = filteredCities.any((c) => c.cityNameEn == widget.address?.city)
              ? widget.address?.city
              : filteredCities.isNotEmpty
                  ? filteredCities.first.cityNameEn
                  : null;
        });
      });
    });
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    recipientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<AddressCubit, AddressStates>(
        listener: (context, state) {
          if (state is UpdateAddressSuccessState) {
            displayAlertDialog(
              title: const Text('Updated Successfully'),
              showOkButton: true,
              onOkButtonClick: () {
                Navigator.pop(context);
              },
            );
          } else if (state is UpdateAddressErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errorModel.error}')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              leadingWidth: screenWidth * 0.08,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, DefinedRoutes.savedAddress);
                  },
                ),
              ),
              title: Text(
                LocaleKeys.updateAddress.tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Image(
                        image: AssetImage('assets/icons/map.png'),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.addressTitle.tr(),
                          hintText: LocaleKeys.addressHint.tr(),
                        ),
                        validator: (inputText) {
                          return validateFunctions.validationOfAddress(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.phoneNumber.tr(),
                          hintText: LocaleKeys.phoneNumberHint.tr(),
                        ),
                        validator: (inputText) {
                          return validateFunctions.validationOfPhoneNumber(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextFormField(
                        controller: recipientController,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.recipient.tr(),
                          hintText: LocaleKeys.recipientNameHint.tr(),
                        ),
                        validator: (inputText) {
                          return validateFunctions.validationOfrecipient(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdown(
                              value: selectedGovernorate ?? '',
                              items: governorates.map((e) => e.nameEn).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedGovernorate = value ?? '';
                                  selectedGovernorateId = governorates
                                      .firstWhere((g) => g.nameEn == value)
                                      .id;
                                  filteredCities = allCities
                                      .where((c) => c.governorateId == selectedGovernorateId)
                                      .toList();
                                  selectedArea = filteredCities.isNotEmpty
                                      ? filteredCities.first.cityNameEn
                                      : '';
                                });
                              },
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            child: _buildDropdown(
                              value: selectedArea ?? '',
                              items: filteredCities.map((c) => c.cityNameEn).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedArea = value ?? '';
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      CurvedButton(
                        title: LocaleKeys.updateAddress.tr(),
                        onTap: () async {
                          if (_formKey.currentState!.validate() && widget.address?.id != null) {
                            var latLong = await viewModel.getLatLongFromCountry(selectedGovernorate ?? '');
                            context.read<AddressCubit>().processIntent(
                                  EditAddress(
                                    widget.address?.id??'',
                                    addressController.text,
                                    phoneController.text,
                                    selectedArea ?? selectedGovernorate ?? '',
                                    latLong?['latitude'].toString(),
                                    latLong?['longitude'].toString(),
                                    recipientController.text,
                                    AddressEntity(
                                      id: widget.address?.id??'',
                                      street: addressController.text,
                                      phone: phoneController.text,
                                      city: selectedArea ?? selectedGovernorate ?? '',
                                      lat: latLong?['latitude'].toString(),
                                      long: latLong?['longitude'].toString(),
                                      username: recipientController.text,
                                    ),
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value.isEmpty ? null : value,
      isExpanded: true,
      onChanged: items.isEmpty ? null : onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      items: items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e, overflow: TextOverflow.ellipsis),
              ))
          .toList(),
    );
  }
}