import 'dart:developer';

import 'package:flower_ecommerce_app_team5/core/utilities/bloc_observer/bloc_observer.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_cubit.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/view_model/check_out_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../core/colors/app_colors.dart';

class GiftSection extends StatefulWidget {
  const GiftSection({super.key});

  @override
  State<GiftSection> createState() => _GiftSectionState();
}

class _GiftSectionState extends BaseStatefulWidgetState<GiftSection> {
  late final FocusNode nameFocusNode;
  late final FocusNode phoneFocusNode;
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final ValueNotifier<bool> isGift;

  @override
  void initState() {
    super.initState();
    isGift = ValueNotifier<bool>(false);
    nameController = TextEditingController();
    phoneController = TextEditingController();
    nameFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
  }

  @override
  void dispose() {
    isGift.dispose(); // Don't forget to dispose ValueNotifier
    nameController.dispose();
    phoneController.dispose();
    nameFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: BlocBuilder<CheckOutCubit, CheckOutState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Switch(
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.mainColor,
                    inactiveThumbColor: AppColors.white,
                    inactiveTrackColor: AppColors.gray,
                    value: state.isGift,
                    onChanged: (bool newValue) {
                      if (state.selectedPaymentMethod == 'Cash on delivery' ||
                          state.selectedPaymentMethod == null) {
                        context
                            .read<CheckOutCubit>()
                            .doIntent(ChangeSwitchIntent(
                              val: false,
                            ));
                        return;
                      }
                      context.read<CheckOutCubit>().doIntent(ChangeSwitchIntent(
                            val: newValue,
                          ));
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'It is a gift',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              Visibility(
                visible: state.isGift &&
                    state.selectedPaymentMethod == 'Credit card',
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      focusNode: nameFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Enter the name',
                        labelText: 'Name',
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      focusNode: phoneFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Enter phone number',
                        labelText: 'Phone number',
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
