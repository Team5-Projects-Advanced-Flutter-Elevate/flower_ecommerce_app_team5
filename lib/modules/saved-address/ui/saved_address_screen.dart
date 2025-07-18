import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/saved-address/ui/view_model/saved_address_state.dart';
import 'package:flower_ecommerce_app_team5/modules/saved-address/ui/view_model/saved_address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/assets_paths.dart';
import '../../../core/di/injectable_initializer.dart';
import '../../../shared_layers/localization/generated/locale_keys.g.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState
    extends BaseStatefulWidgetState<SavedAddressScreen> {
  final SavedAddressViewModel savedAddressViewModel =
      getIt.get<SavedAddressViewModel>();
  @override
  void initState() {
    savedAddressViewModel.onIntent(GetSavedAddressesIntent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => savedAddressViewModel,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          titleSpacing: 0,
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.savedAddress.tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        body: BlocBuilder<SavedAddressViewModel, SavedAddressState>(
          bloc: savedAddressViewModel,
          builder: (context, state) {
            if (state.loadAddressesState == LoadSavedAddressesState.loading) {
              return const LoadingWidget();
            } else if (state.loadAddressesState ==
                LoadSavedAddressesState.error) {
              return ErrorStateWidget(error: state.loadAddressesErr!);
            } else if (state.deleteAddressState == DeleteAddressState.error) {
              return ErrorStateWidget(error: state.deleteAddressErr!);
            }

            // Main content display
            return _buildAddressContent(state, context);
          },
        ),
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  final AddressEntity address;
  final VoidCallback onDelete;
  final SavedAddressState state;

  const AddressItem({
    super.key,
    required this.address,
    required this.onDelete,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white[60]!),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    address.city ?? "",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                address.street ?? "",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: onDelete,
                child: state.deleteAddressState == DeleteAddressState.loading &&
                        state.deleteAddressId == address.id
                    ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: LoadingWidget())
                    : ImageIcon(
                        AssetImage(
                          AssetsPaths.deleteIcon,
                        ),
                        size: 18,
                        color: AppColors.red,
                      ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  Navigator.pushNamed<bool>(
                          context, DefinedRoutes.updateAddressRoute,
                          arguments: address)
                      .then(
                    (didAddressUpdated) {
                      if (didAddressUpdated == true) {
                        if (!context.mounted) return;
                        BlocProvider.of<SavedAddressViewModel>(context)
                            .onIntent(GetSavedAddressesIntent());
                      }
                    },
                  );
                },
                child: const Icon(Icons.edit_outlined, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildAddressContent(SavedAddressState state, BuildContext context) {
  return Column(
    children: [
      state.addressesList?.isEmpty ?? true
          ? Expanded(
              child: Center(child: Text(LocaleKeys.noAddressesFound.tr())))
          : Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: state.addressesList?.length ?? 0,
                itemBuilder: (context, index) {
                  final address = state.addressesList![index];
                  return AddressItem(
                    state: state,
                    address: address,
                    onDelete: () =>
                        context.read<SavedAddressViewModel>().onIntent(
                              DeleteAddressIntent(addressId: address.id!),
                            ),
                  );
                },
              ),
            ),
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, DefinedRoutes.addNewAddress)
                      .then(
                    (addressEntity) {
                      if (addressEntity != null) {
                        if (!context.mounted) return;
                        BlocProvider.of<SavedAddressViewModel>(context)
                            .onIntent(GetSavedAddressesIntent());
                      }
                    },
                  );
                },
                child: Text(
                  LocaleKeys.addNew.tr(),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
