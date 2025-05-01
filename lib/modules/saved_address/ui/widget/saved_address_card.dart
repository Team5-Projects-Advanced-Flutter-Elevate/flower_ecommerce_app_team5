import 'package:flower_ecommerce_app_team5/core/bases/base_inherited_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../../core/constants/assets_paths.dart';
import '../../../../core/colors/app_colors.dart';
import '../../data/models/saved_address_response/saved_address_response_dto.dart';

class SavedAddressCard extends BaseStatelessWidget {
  const SavedAddressCard({super.key, required this.response});
  final AddressEntity response;

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white[60]!),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                  Text(response.city ?? ""),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text('${response.street}')
            ],
          ),
          Row(
            children: [
              Image.asset(AssetsPaths.deleteIcon),
              Image.asset(AssetsPaths.edit)
            ],
          )
        ],
      ),
    );
  }
}
