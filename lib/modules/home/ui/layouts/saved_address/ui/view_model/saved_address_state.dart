import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/domain/entities/saved_address/saved_address_response_entity.dart';

enum SavedAddressStatus { initial, loading, success, error }

class SavedAddressState extends Equatable {
  final SavedAddressStatus savedAddressStatus;
  final SavedAddressResponseEntity? savedAddress;
  final Object? error;

  const SavedAddressState(
      {this.savedAddressStatus = SavedAddressStatus.initial,
        this.savedAddress,
        this.error});

  @override
  List<Object?> get props => [savedAddressStatus, savedAddress, error];
}

enum UpdateAddressStatus { initial, loading, success, error }

class UpdateAddressState extends Equatable {
  final UpdateAddressStatus updateAddressStatus;
  final SavedAddressResponseEntity? updateAddress;
  final Object? error;

  const UpdateAddressState(
      {this.updateAddressStatus = UpdateAddressStatus.initial,
        this.updateAddress,
        this.error});

  @override
  List<Object?> get props => [updateAddressStatus, updateAddress, error];
}

enum DeleteAddressStatus { initial, loading, success, error }

class DeleteAddressState extends Equatable {
  final DeleteAddressStatus deleteAddressStatus;
  final SavedAddressResponseEntity? updateAddress;
  final Object? error;

  const DeleteAddressState(
      {this.deleteAddressStatus = DeleteAddressStatus.initial,
        this.updateAddress,
        this.error});

  @override
  List<Object?> get props => [deleteAddressStatus, updateAddress, error];
}