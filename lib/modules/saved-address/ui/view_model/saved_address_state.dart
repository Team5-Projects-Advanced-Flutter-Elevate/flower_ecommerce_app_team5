import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';

enum LoadSavedAddressesState { initial, loading, success, error }

enum DeleteAddressState { initial, loading, success, error }

class SavedAddressState extends Equatable {
  final LoadSavedAddressesState loadAddressesState;
  final DeleteAddressState deleteAddressState;
  final Object? loadAddressesErr;
  final Object? deleteAddressErr;
  final String? deleteAddressId;
  final List<AddressEntity>? addressesList;

  const SavedAddressState(
      {this.loadAddressesState = LoadSavedAddressesState.initial,
      this.deleteAddressState = DeleteAddressState.initial,
      this.loadAddressesErr,
      this.deleteAddressErr,
      this.addressesList,
      this.deleteAddressId});

  SavedAddressState copyWith({
    LoadSavedAddressesState? loadAddressesState,
    DeleteAddressState? deleteAddressState,
    Object? loadAddressesErr,
    Object? deleteAddressErr,
    List<AddressEntity>? addressesList,
    String? addressId,
  }) {
    return SavedAddressState(
      deleteAddressId: addressId ?? this.deleteAddressId,
      loadAddressesState: loadAddressesState ?? this.loadAddressesState,
      deleteAddressState: deleteAddressState ?? this.deleteAddressState,
      loadAddressesErr: loadAddressesErr ?? this.loadAddressesErr,
      deleteAddressErr: deleteAddressErr ?? this.deleteAddressErr,
      addressesList: addressesList ?? this.addressesList,
    );
  }

  @override
  List<Object?> get props => [
        loadAddressesState,
        deleteAddressState,
        loadAddressesErr,
        deleteAddressErr,
        addressesList,
        deleteAddressId
      ];
}
