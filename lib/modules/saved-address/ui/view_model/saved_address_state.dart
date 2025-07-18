import 'package:equatable/equatable.dart';

import '../../domain/entities/saved_address_entity.dart';

enum LoadSavedAddressesState { initial, loading, success, error }

enum DeleteAddressState { initial, success, error }

class SavedAddressState extends Equatable {
  final LoadSavedAddressesState loadAddressesState;
  final DeleteAddressState deleteAddressState;
  final Object? loadAddressesErr;
  final Object? deleteAddressErr;
  final List<SavedAddressEntity>? addressesList;

  const SavedAddressState({
    this.loadAddressesState = LoadSavedAddressesState.initial,
    this.deleteAddressState = DeleteAddressState.initial,
    this.loadAddressesErr,
    this.deleteAddressErr,
    this.addressesList,
  });

  SavedAddressState copyWith({
    LoadSavedAddressesState? loadAddressesState,
    DeleteAddressState? deleteAddressState,
    Object? loadAddressesErr,
    Object? deleteAddressErr,
    List<SavedAddressEntity>? addressesList,
  }) {
    return SavedAddressState(
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
      ];
}
