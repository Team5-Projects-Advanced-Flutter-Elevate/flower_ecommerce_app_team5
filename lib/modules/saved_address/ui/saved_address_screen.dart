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

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState
    extends BaseStatefulWidgetState<SavedAddressScreen> {
  AddressViewModel viewModel = getIt.get<AddressViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(GetAddress());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          titleSpacing: 0.0,
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            LocaleKeys.savedAddress.tr(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        body: BlocBuilder<AddressViewModel, AddressState>(
          builder: (context, state) {
            switch (state.addressStatus) {
              case AddressStatus.initial:
              case AddressStatus.loading:
                return const LoadingWidget();
              case AddressStatus.success:
                if (state.address!.address!.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Text(LocaleKeys.savedAddressListIsEmpty.tr())),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              DefinedRoutes.addNewAddress,
                            );
                          },
                          child: Text(LocaleKeys.addNewAddress.tr()))
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => SavedAddressCard(
                            response: state.address!.address![index],
                          ),
                          itemCount: state.address!.address!.length,
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              DefinedRoutes.addNewAddress,
                            );
                          },
                          child: Text(LocaleKeys.addNewAddress.tr())),
                      const SizedBox(
                        height: 48,
                      ),
                    ],
                  );
                }
              case AddressStatus.error:
                return ErrorStateWidget(error: state.error.toString());
            }
          },
        ),
      ),
    );
  }
}
