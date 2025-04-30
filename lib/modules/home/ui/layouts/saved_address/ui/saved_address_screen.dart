import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/ui/view_model/saved_address_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/ui/view_model/saved_address_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/ui/view_model/saved_address_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/ui/widget/saved_address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../core/widgets/loading_state_widget.dart';
import '../../../../../../shared_layers/localization/generated/locale_keys.g.dart';


class SavedAddressScreen extends StatefulWidget {
  SavedAddressScreen({super.key});
  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  SavedAddressViewModel viewModel = getIt.get<SavedAddressViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.doIntent(GetSavedAddress(viewModel.address));
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Row(children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                size: 20, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(LocaleKeys.savedAddress,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w500
          ),)
        ],),),
        body:  BlocConsumer<SavedAddressViewModel,SavedAddressState>(
          builder: (context, state) {
            switch(state.savedAddressStatus){
              case SavedAddressStatus.initial:
                return const SizedBox();
              case SavedAddressStatus.loading:
                return const LoadingWidget();
              case SavedAddressStatus.success:
                if(state.savedAddress!.address!.isEmpty ){
                  return Column(
                    children: [
                      Text("Saved Address List is Empty"),
                    ],
                  );
                }else{
                  return Column(children: [
                    Expanded(child: ListView.separated(itemBuilder: (context, index) => SavedAddressCard(response: state.savedAddress!.address![index],), separatorBuilder: (context, index) => const SizedBox(height: 16,), itemCount: state.savedAddress!.address!.length??0,)),
                    const SizedBox(height: 48,),
                    Expanded(child: ElevatedButton(onPressed: () {

                    }, child: const Text(LocaleKeys.addNewAddress))),
                    const Spacer(),
                  ],);
                }
              case SavedAddressStatus.error:
                return ErrorStateWidget(error: state.error.toString());
            }
          },
          buildWhen: (previous, current) {
            if(current.savedAddressStatus case SavedAddressStatus.success){
              return true;
            }
            return false;
          },
          listener: (context,state) {
            if(state.savedAddressStatus == SavedAddressStatus.error){
              ErrorStateWidget(error: state.error.toString(),);
            }
          },
        ),
      ),
    );
  }
}
