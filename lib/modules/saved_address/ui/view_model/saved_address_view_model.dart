import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/domain/use_cases/saved_address/get_saved_address_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/saved_address/ui/view_model/saved_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/saved_address/saved_address_response_entity.dart';
import '../../domain/use_cases/saved_address/delete_address_use_case.dart';
import '../../domain/use_cases/saved_address/update_address_use_case.dart';

@injectable
class AddressViewModel extends Cubit<AddressState> {
  GetSavedAddressUseCase savedAddressUseCase;
  DeleteAddressUseCase deleteAddressUseCase;
  UpdateAddressUseCase updateAddressUseCase;

  AddressViewModel(this.savedAddressUseCase,this.deleteAddressUseCase,this.updateAddressUseCase)
      : super(const AddressState());

  Future<void> doIntent(AddressIntent intent) {
    switch (intent) {
      case GetAddress():
        return _getSavedAddressUseCase();
      case DeleteAddress():
        return _deleteAddressUseCase(intent.productId);
      case UpdateAddress():
        return _updateAddressUseCase(intent.productId);
    }
  }

  Future<void> _getSavedAddressUseCase() async {
    emit(const AddressState(addressStatus: AddressStatus.loading));
    var useCaseResult = await savedAddressUseCase();
    switch (useCaseResult) {
      case Success<SavedAddressResponseEntity>():
        emit(AddressState(addressStatus: AddressStatus.success,address: useCaseResult.data));
      case Error<SavedAddressResponseEntity>():
        emit(AddressState(addressStatus: AddressStatus.error, error: useCaseResult.error));
    }
  }

  Future<void> _deleteAddressUseCase(String productId) async {
    emit(const AddressState(addressStatus: AddressStatus.loading));
    var useCaseResult = await deleteAddressUseCase(productId);
    switch (useCaseResult) {
      case Success<SavedAddressResponseEntity>():
        emit(AddressState(addressStatus: AddressStatus.success,address: useCaseResult.data));
      case Error<SavedAddressResponseEntity>():
        emit(AddressState(addressStatus: AddressStatus.error, error: useCaseResult.error));
    }
  }

  Future<void> _updateAddressUseCase(String productId) async {
    emit(const AddressState(addressStatus: AddressStatus.loading));
    var useCaseResult = await updateAddressUseCase(productId);
    switch (useCaseResult) {
      case Success<SavedAddressResponseEntity>():
        emit(AddressState(addressStatus: AddressStatus.success,address: useCaseResult.data));
      case Error<SavedAddressResponseEntity>():
        emit(AddressState(addressStatus: AddressStatus.error, error: useCaseResult.error));
    }
  }
}

