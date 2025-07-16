import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCardItem extends StatelessWidget {
  final AddressEntity address;
  const CustomCardItem({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: null,
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.008),
        child: Card(
          color: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.008),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.020,
                        height: MediaQuery.of(context).size.height * 0.020,
                        child: Image.asset('assets/images/saved-address.png')),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.006,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        address.street ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize:
                                MediaQuery.of(context).textScaler.scale(16),
                            color: AppColors.black),
                      ),
                    ),
                    // const Spacer(),
                    InkWell(
                      onTap: () {
                        context
                            .read<AddressCubit>()
                            .processIntent(DeleteAddress(address.id!));
                      },
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                          height: MediaQuery.of(context).size.height * 0.02,
                          child: Image.asset('assets/icons/trach_icon.png')),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, DefinedRoutes.updateAddress,
                            arguments: address);
                      },
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                          height: MediaQuery.of(context).size.height * 0.02,
                          child: Image.asset('assets/icons/edit_address.png')),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.014,
                ),
                Text(
                  '${address.city} - ${address.street}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).textScaler.scale(14),
                      color: AppColors.gray),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
