import 'package:flower_ecommerce_app_team5/core/bases/base_inherited_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/bases/base_statless_widget.dart';
import '../../../../../../../core/constants/assets_paths.dart';
import '../../data/models/saved_address_response/saved_address_response_dto.dart';

class SavedAddressCard extends BaseStatelessWidget {
  SavedAddressCard({super.key,required this.response});
  AddressEntity response;

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on,size: 20,),
                      Text(response?.city??""),
                    ],
                  ),
                  const SizedBox(height: 16.0,),
                  Text('${response?.id} - ${response?.street}')
                ],
              ),
              Row(children: [
                Image.asset(AssetsPaths.deleteIcon),
                Image.asset(AssetsPaths.edit)
              ],)
            ],
          )
        ],
      ),
    );
  }
}
