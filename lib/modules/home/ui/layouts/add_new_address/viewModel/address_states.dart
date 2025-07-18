import 'package:flower_ecommerce_app_team5/core/apis/api_error/api_error_model.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';

sealed class AddressStates {}

class GetSavedAddressesInitialState extends AddressStates {}

class GetSavedAddressesLoadingState extends AddressStates {}

class GetSavedAddressesSuccessState extends AddressStates {
  final List<AddressModelEntity> addresses;

  GetSavedAddressesSuccessState(this.addresses);
}

class GetSavedAddressesErrorState extends AddressStates {
  final ApiErrorModel errorModel;

  GetSavedAddressesErrorState(this.errorModel);
}

class DeleteAddressLoadingState extends AddressStates {}

class DeleteAddressSuccessState extends AddressStates {
  final List<AddressModelEntity> addresses;

  DeleteAddressSuccessState(this.addresses);
}

class DeleteAddressErrorState extends AddressStates {
  final ApiErrorModel errorModel;

  DeleteAddressErrorState(this.errorModel);
}

class UpdateAddressLoadingState extends AddressStates {}

class UpdateAddressSuccessState extends AddressStates {
  final List<AddressModelEntity> addresses;

  UpdateAddressSuccessState(this.addresses);
}

class UpdateAddressErrorState extends AddressStates {
  final ApiErrorModel errorModel;

  UpdateAddressErrorState(this.errorModel);
}