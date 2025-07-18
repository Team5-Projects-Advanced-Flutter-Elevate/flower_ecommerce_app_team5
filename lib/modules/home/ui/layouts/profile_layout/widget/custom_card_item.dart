import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/add_new_address/viewModel/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCardItem extends StatelessWidget {
  final AddressModelEntity address;

  const CustomCardItem({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.008),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.008),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Row(children: [
                    SizedBox(
                    width: MediaQuery.of(context).size.width * 0.040,
                    height: MediaQuery.of(context).size.height * 0.040,
                    child: Image.asset('assets/images/saved-address.png'),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      address.street ?? 'Unknown Street',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).textScaler.scale(16),
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  ],),
                  Row(children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                   InkWell(
                    onTap: () {
                      if (address.id != null) {
                        context.read<AddressCubit>().processIntent(DeleteAddress(address.id!));
                      }
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Image.asset('assets/icons/trach_icon.png'),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DefinedRoutes.updateAddress,
                        arguments: address,
                      );
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Image.asset('assets/icons/edit_address.png'),
                    ),
                  ),
                  ],),
                  
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.014),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Text(
                    '${address.city ?? 'Unknown City'} - ${address.street ?? 'Unknown Street'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).textScaler.scale(14),
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}