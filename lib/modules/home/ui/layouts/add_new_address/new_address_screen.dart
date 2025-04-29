import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/new_address_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../../../domain/entities/cities_states_entity/get_cities.dart';
import '../../../domain/entities/cities_states_entity/get_states.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({
    super.key,
  });

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
  var selectedGovernorate;
  var selectedGovernorateId;
  var selectedArea;

  NewAddressViewModelCubit viewModel = getIt.get<NewAddressViewModelCubit>();
  AddressModelEntity? newAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadGovernorates().then((value) {
      setState(() {
        governorates = value;
        selectedGovernorate = governorates.first.nameEn;
      });
    });
    viewModel.loadCities().then((value) {
      setState(() {
        allCities = value;
        selectedArea = allCities.first.cityNameEn;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<NewAddressViewModelCubit, AddressState>(
        listener: (context, state) {
          if (state is AddressSuccess) {
            displayAlertDialog(
              title: const Text(
                'Saved Successfuly',
              ),
              showOkButton: true,
              onOkButtonClick: () {
                Navigator.pop(context);
              },
            );
          } else if (state is AddressError) {
            print('errror${state.errorMessage}');
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
                    Navigator.pop(context, newAddress);
                  },
                ),
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
                    // spacing: 25,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Image(
                        image: AssetImage('assets/icons/map.png'),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.addressTitle.tr(),
                          hintText: LocaleKeys.addressHint.tr(),
                        ),
                        validator: (inputText) {
                          return validateFunctions
                              .validationOfAddress(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // label: LocaleKeys.addressHint.tr(),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.phoneNumber.tr(),
                          hintText: LocaleKeys.phoneNumberHint.tr(),
                        ),
                        validator: (inputText) {
                          return validateFunctions
                              .validationOfPhoneNumber(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextFormField(
                        controller: recipientController,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.recipient.tr(),
                          hintText: LocaleKeys.recipientNameHint.tr(),
                        ),
                        validator: (inputText) {
                          return validateFunctions
                              .validationOfrecipient(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // label: LocaleKeys.addressHint.tr(),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        // spacing: 10,
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
                                          .id ??
                                      '';

                                  filteredCities = allCities
                                      .where((c) =>
                                          c.governorateId ==
                                          selectedGovernorateId)
                                      .toList();

                                  selectedArea = filteredCities.isNotEmpty
                                      ? filteredCities.first.cityNameEn
                                      : '';
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          Expanded(
                            child: _buildDropdown(
                              value: selectedArea ?? '',
                              items: filteredCities
                                  .map((c) => c.cityNameEn)
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedArea = value;
                                  print(selectedArea);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var latLong = await viewModel
                              .getLatLongFromCountry(selectedGovernorate);
                          var lat = latLong?['latitude'];
                          var long = latLong?['longitude'];
                          print(lat);
                          viewModel.processIntent(
                            AddAddress(
                              addressController.text,
                              phoneController.text,
                              selectedGovernorate,
                              latLong?['latitude'].toString(),
                              latLong?['longitude'].toString(),
                              recipientController.text,
                            ),
                          );
                          newAddress = AddressModelEntity(
                            street: addressController.text,
                            lat: latLong?['latitude'].toString(),
                            phone: phoneController.text,
                            long: latLong?['longitude'].toString(),
                            city: selectedGovernorate,
                            username: recipientController.text,
                          );
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

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      items: items
          .map((e) => DropdownMenuItem(
              value: e, child: Text(e, overflow: TextOverflow.ellipsis)))
          .toList(),
    );
  }
}
