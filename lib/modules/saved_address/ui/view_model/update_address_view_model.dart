import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/saved_address_response/saved_address_response_dto.dart';
import '../../domain/entities/saved_address/saved_address_response_entity.dart';
import '../../domain/use_cases/saved_address/update_address_use_case.dart';

@injectable
class UpdateAddressViewModel extends Cubit<UpdateAddressState> {
  UpdateAddressUseCase updateAddressUseCase;

  UpdateAddressViewModel(this.updateAddressUseCase)
      : super(const UpdateAddressState());

  Future<void> doIntent(UpdateAddressIntent intent) {
    switch (intent) {
      case UpdateAddress():
        return _updateAddressUseCase(intent.addressEntity,intent.userId);
    }
  }

  Future<void> _updateAddressUseCase(AddressEntity address,String userId) async {
    emit(const UpdateAddressState(updateAddressStatus: UpdateAddressStatus.loading));
    var useCaseResult = await updateAddressUseCase(address,userId);
    switch (useCaseResult) {
      case Success<SavedAddressResponseEntity>():
        emit(UpdateAddressState(updateAddressStatus: UpdateAddressStatus.success,updateAddress: useCaseResult.data));
      case Error<SavedAddressResponseEntity>():
        emit(UpdateAddressState(updateAddressStatus: UpdateAddressStatus.error, error: useCaseResult.error));
    }
  }
}

