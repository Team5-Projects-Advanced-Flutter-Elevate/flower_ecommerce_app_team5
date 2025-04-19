import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';

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
  String selectedCity = 'Cairo';
  String selectedArea = 'October';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        leadingWidth: screenWidth * 0.08,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
            onPressed: () => Navigator.pop(context),
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
              spacing: 25,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               const Image(image: AssetImage('assets/icons/map.png'),),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.addressTitle.tr(),
                    hintText:  LocaleKeys.addressHint.tr(),
                  ),
                  validator: (inputText) {
                    return validateFunctions.validationOfAddress(inputText);
                  },
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  // label: LocaleKeys.addressHint.tr(),
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.phoneNumber.tr(),
                    hintText:  LocaleKeys.phoneNumberHint.tr(),
                  ),
                  validator: (inputText) {
                    return validateFunctions
                        .validationOfPhoneNumber(inputText);
                  },
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
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
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  // label: LocaleKeys.addressHint.tr(),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: _buildDropdown(
                        value: selectedCity,
                        items: ['Cairo', 'Giza', 'Alex'],
                        onChanged: (value) => setState(() => selectedCity = value!),
                      ),
                    ),
                    Expanded(
                      child: _buildDropdown(
                        value: selectedArea,
                        items: ['October', 'Nasr City', 'Zamalek'],
                        onChanged: (value) => setState(() => selectedArea = value!),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle saving address
                  },
                  child: Text(
                    LocaleKeys.saveAddress.tr(),
                    style:  TextStyle(color:AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
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
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
    );
  }
}
