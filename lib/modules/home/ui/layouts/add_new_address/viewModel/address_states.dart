import 'package:flower_ecommerce_app_team5/core/apis/api_error/api_error_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';

sealed class AddressStates {}

class GetSavedAddressesInitialState extends AddressStates {}

class GetSavedAddressesLoadingState extends AddressStates {}

class GetSavedAddressesSuccessState extends AddressStates {
  final List<AddressEntity> addresses;

  GetSavedAddressesSuccessState(this.addresses);
}

class GetSavedAddressesErrorState extends AddressStates {
  final ApiErrorModel errorModel;

  GetSavedAddressesErrorState(this.errorModel);
}

class DeleteAddressLoadingState extends AddressStates {}

class DeleteAddressSuccessState extends AddressStates {
  final List<AddressEntity> addresses;

  DeleteAddressSuccessState(this.addresses);
}

class DeleteAddressErrorState extends AddressStates {
  final ApiErrorModel errorModel;

  DeleteAddressErrorState(this.errorModel);
}

class UpdateAddressLoadingState extends AddressStates {}

class UpdateAddressSuccessState extends AddressStates {
  final List<AddressEntity> addresses;

  UpdateAddressSuccessState(this.addresses);
}

class UpdateAddressErrorState extends AddressStates {
  final ApiErrorModel errorModel;

  UpdateAddressErrorState(this.errorModel);
}