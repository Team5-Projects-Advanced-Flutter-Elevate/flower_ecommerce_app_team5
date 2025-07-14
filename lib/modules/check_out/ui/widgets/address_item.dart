import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../core/colors/app_colors.dart';

class AddressItem extends StatefulWidget {
  const AddressItem({super.key, required this.addressModel});

  final AddressModelEntity addressModel;

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends BaseStatefulWidgetState<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.12,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.white[90]!.withAlpha(64),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocBuilder<CheckOutCubit, CheckOutState>(
                    builder: (context, state) {
                      return Radio<String>(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: widget.addressModel.id!,
                        groupValue: state.selectedDeliveryAddress ??
                            state.addressesResponseEntity?.addresses?[0].id,
                        onChanged: (val) {
                          if (val != null) {
                            context
                                .read<CheckOutCubit>()
                                .doIntent(ChangeAddressIntent(
                                  address: val,
                                  addressModelEntity: widget.addressModel,
                                ));
                          }
                        },
                      );
                    },
                  ),
                  Text(
                    widget.addressModel.street ?? '',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 12 * (screenWidth / 375),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 8,
                ),
                child: Text(widget.addressModel.city ?? '',
                    style: GoogleFonts.roboto(
                      textStyle: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10 * (screenWidth / 375),
                        color: AppColors.gray,
                      ),
                    )),
              )
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.edit_outlined,
          ),
        ],
      ),
    );
  }
}
