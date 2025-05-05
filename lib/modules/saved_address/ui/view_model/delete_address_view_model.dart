// import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
// import 'package:flower_ecommerce_app_team5/modules/saved_address/domain/entities/saved_address/saved_address_response_entity.dart';
// import 'package:flower_ecommerce_app_team5/modules/saved_address/domain/use_cases/saved_address/delete_address_use_case.dart';
// import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_intent.dart';
// import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import '../../data/models/saved_address_response/saved_address_response_dto.dart';
//
// @injectable
// class DeleteAddressViewModel extends Cubit<AddressState> {
//   DeleteAddressUseCase deleteAddressUseCase;
//
//   DeleteAddressViewModel(this.deleteAddressUseCase)
//       : super(const AddressState());
//
//   Future<void> doIntent(DeleteAddressIntent intent) {
//     switch (intent) {
//       case DeleteAddress():
//         return _deleteAddressUseCase(intent.addressEntity,intent.userId);
//     }
//   }
//
//   Future<void> _deleteAddressUseCase(AddressEntity address,String userId) async {
//     emit(const AddressState(addressStatus: AddressStatus.loading));
//     var useCaseResult = await deleteAddressUseCase(address,userId);
//     switch (useCaseResult) {
//       case Success<SavedAddressResponseEntity>():
//         emit(AddressState(addressStatus: AddressStatus.success,address: useCaseResult.data));
//       case Error<SavedAddressResponseEntity>():
//         emit(AddressState(addressStatus: AddressStatus.error, error: useCaseResult.error));
//     }
//   }
// }
//
