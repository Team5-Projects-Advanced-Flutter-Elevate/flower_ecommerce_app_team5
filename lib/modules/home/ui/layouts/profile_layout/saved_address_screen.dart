import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/widget/address_list.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/widget/curved_buttons.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState
    extends BaseStatefulWidgetState<SavedAddressScreen> {
  AddressEntity? address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text(LocaleKeys.savedAddress.tr()),
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: Column(
            children: [
              const AddressList(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.34,
                height: MediaQuery.of(context).size.height * 0.065,
                child: CurvedButton(
                    title: context.tr(LocaleKeys.addNew),
                    onTap: () {
                      Navigator.pushNamed(context, DefinedRoutes.updateAddress,
                          arguments: address);
                    }),
              ),
            ],
          ),
        ));
  }
}
