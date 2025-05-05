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

class SavedAddressCard extends BaseStatelessWidget {
  const SavedAddressCard({super.key, required this.response});
  final AddressEntity response;

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
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
                  const Icon(Icons.location_on_rounded, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    response.city ?? "",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                response.street ?? "",
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
                onTap: () {
                  context.read<AddressViewModel>().doIntent(
                    DeleteAddress(response.id ?? ""),
                  );
                },
                child: Image.asset(AssetsPaths.deleteIcon, width: 24, height: 24),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: () {
                  context.read<AddressViewModel>().doIntent(
                    UpdateAddress(response.id ?? ""),
                  );
                },
                child: Image.asset(AssetsPaths.edit, width: 18, height: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}
