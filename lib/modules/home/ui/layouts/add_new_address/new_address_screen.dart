import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/new_address_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../core/widgets/loading_state_widget.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../../../domain/entities/cities_states_entity/get_cities.dart';
import '../../../domain/entities/cities_states_entity/get_states.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({super.key});

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends BaseStatefulWidgetState<NewAddressScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController recipientController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  List<GetCities> governorates = [];
  List<City> allCities = [];
  List<City> filteredCities = [];

  String? selectedGovernorate;
  String selectedGovernorateId = '';
  String? selectedArea;

  final NewAddressViewModelCubit viewModel =
      getIt.get<NewAddressViewModelCubit>();
  AddressModelEntity? newAddress;

  @override
  void initState() {
    super.initState();
    _initializeAddressData();
  }

  Future<void> _initializeAddressData() async {
    try {
      final loadedGovernorates = await viewModel.loadGovernorates();
      final loadedCities = await viewModel.loadCities();

      if (loadedGovernorates.isNotEmpty) {
        selectedGovernorate = loadedGovernorates.first.nameEn;
        selectedGovernorateId = loadedGovernorates.first.id;

        filteredCities = loadedCities
            .where((city) => city.governorateId == selectedGovernorateId)
            .toList();

        selectedArea =
            filteredCities.isNotEmpty ? filteredCities.first.cityNameEn : null;
      }

      setState(() {
        governorates = loadedGovernorates;
        allCities = loadedCities;
      });
    } catch (e) {
      debugPrint('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocConsumer<NewAddressViewModelCubit, AddressState>(
        listener: (context, state) {
          if (state is AddressSuccess) {
            displayAlertDialog(
              title: const Text('Saved Successfully'),
              showOkButton: true,
              onOkButtonClick: () {
                Navigator.pop(context, newAddress);
              },
            );
          } else if (state is AddressError) {
            debugPrint('Address Error: ${state.errorMessage}');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              titleSpacing: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    size: 20, color: Colors.black),
                onPressed: () => Navigator.pop(context, newAddress),
              ),
              title: Text(LocaleKeys.addressTitle.tr(),
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Image(image: AssetImage('assets/icons/map.png')),
                      SizedBox(height: screenHeight * 0.02),
                      _buildTextField(
                        controller: addressController,
                        label: LocaleKeys.addressTitle.tr(),
                        hint: LocaleKeys.addressHint.tr(),
                        validator: validateFunctions.validationOfAddress,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      _buildTextField(
                        controller: phoneController,
                        label: LocaleKeys.phoneNumber.tr(),
                        hint: LocaleKeys.phoneNumberHint.tr(),
                        validator: validateFunctions.validationOfPhoneNumber,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      _buildTextField(
                        controller: recipientController,
                        label: LocaleKeys.recipient.tr(),
                        hint: LocaleKeys.recipientNameHint.tr(),
                        validator: validateFunctions.validationOfrecipient,
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
                                  selectedGovernorate = value;
                                  selectedGovernorateId = governorates
                                      .firstWhere((g) => g.nameEn == value)
                                      .id;
                                  filteredCities = allCities
                                      .where((c) =>
                                          c.governorateId ==
                                          selectedGovernorateId)
                                      .toList();
                                  selectedArea = filteredCities.isNotEmpty
                                      ? filteredCities.first.cityNameEn
                                      : null;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            child: _buildDropdown(
                              value: selectedArea ?? '',
                              items: filteredCities
                                  .map((c) => c.cityNameEn)
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedArea = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      (state is AddressLoading)
                          ? const LoadingWidget()
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState?.validate() != true) {
                                  return;
                                }

                                final latLong =
                                    await viewModel.getLatLongFromCountry(
                                        selectedGovernorate ?? '');
                                final lat = latLong?['latitude'].toString();
                                final long = latLong?['longitude'].toString();

                                viewModel.processIntent(
                                  AddAddress(
                                    addressController.text,
                                    phoneController.text,
                                    selectedGovernorate,
                                    lat,
                                    long,
                                    recipientController.text,
                                  ),
                                );

                                newAddress = AddressModelEntity(
                                  street: addressController.text,
                                  lat: lat,
                                  long: long,
                                  phone: phoneController.text,
                                  city: selectedGovernorate,
                                  username: recipientController.text,
                                );
                                addressController.clear();
                                phoneController.clear();
                                recipientController.clear();
                                Navigator.pop(context);
                              },
                              child: Text(
                                LocaleKeys.saveAddress.tr(),
                                style: TextStyle(color: AppColors.white),
                              ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label, hintText: hint),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value.isNotEmpty ? value : null,
      isExpanded: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, overflow: TextOverflow.ellipsis),
              ))
          .toList(),
    );
  }
}
