import 'package:flower_ecommerce_app_team5/core/bases/base_inherited_widget.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../../core/constants/assets_paths.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/loading_state_widget.dart';
import '../../data/models/saved_address_response/saved_address_response_dto.dart';
import '../view_model/saved_address_intent.dart';
import '../view_model/saved_address_view_model.dart';

class SavedAddressCard extends StatelessWidget {
  const SavedAddressCard({
    super.key,
    required this.response,
  });

  final AddressEntity response;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressViewModel, AddressState>(
      builder: (context, state) {
        final viewModel = context.read<AddressViewModel>();

        return Container(
          margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white[60]!),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address details...
              Row(
                children: [
                  IconButton(
                    icon: Image.asset(AssetsPaths.deleteIcon),
                    onPressed: () => viewModel.doIntent(DeleteAddress(response.id!)),
                  ),
                  IconButton(
                    icon: Image.asset(AssetsPaths.edit),
                    onPressed: () => viewModel.doIntent(UpdateAddress(response.id!)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
