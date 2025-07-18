import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/widget/address_list.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/widget/curved_buttons.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends BaseStatefulWidgetState<SavedAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(LocaleKeys.savedAddress.tr()),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios, color: AppColors.black,),),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.04,
        ),
        
          child: const AddressList(),
        ),
      );
  }
}