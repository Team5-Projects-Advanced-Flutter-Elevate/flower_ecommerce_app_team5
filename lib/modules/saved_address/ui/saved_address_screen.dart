import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_state.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/widget/saved_address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../core/widgets/loading_state_widget.dart';
import '../../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../../../core/routing/defined_routes.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.savedAddress.tr()),
      ),
      body: BlocConsumer<AddressViewModel, AddressState>(
        listener: (context, state) {
          if (state.addressStatus == AddressStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error.toString())),
            );
          }
        },
        builder: (context, state) {
          switch (state.addressStatus) {
            case AddressStatus.initial:
            case AddressStatus.loading:
              return const LoadingWidget();
            case AddressStatus.success:
              return _buildAddressList(context, state);
            case AddressStatus.error:
              return ErrorStateWidget(error: state.error.toString());
          }
        },
      ),
    );
  }

  Widget _buildAddressList(BuildContext context, AddressState state) {
    if (state.address?.address?.isEmpty ?? true) {
      return Center(child: Text(LocaleKeys.savedAddressListIsEmpty.tr()));
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.address!.address!.length,
            itemBuilder: (context, index) => SavedAddressCard(
              response: state.address!.address![index],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => _navigateToAddAddress(context),
          child: Text(LocaleKeys.addNewAddress.tr()),
        ),
      ],
    );
  }

  void _navigateToAddAddress(BuildContext context) {
    Navigator.pushNamed(context, DefinedRoutes.editProfileScreenRoute);
  }
}