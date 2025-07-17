import 'package:equatable/equatable.dart';

import '../../domain/entities/saved_address_entity.dart';

enum SavedAddressesState { initial, loading, success, error, idle }

class SavedAddressState extends Equatable {
  final SavedAddressesState loadAddressesState;
  final SavedAddressesState deleteAddressState;
  final String? loadAddressesErrMsg;
  final String? deleteAddressErrMsg;
  final List<SavedAddressEntity>? addressesList;

  const SavedAddressState({
    this.loadAddressesState = SavedAddressesState.initial,
    this.deleteAddressState = SavedAddressesState.initial,
    this.loadAddressesErrMsg,
    this.deleteAddressErrMsg,
    this.addressesList,
  });

  SavedAddressState copyWith({
    SavedAddressesState? loadAddressesState,
    SavedAddressesState? deleteAddressState,
    String? loadAddressesErrMsg,
    String? deleteAddressErrMsg,
    List<SavedAddressEntity>? addressesList,
  }) {
    return SavedAddressState(
      loadAddressesState: loadAddressesState ?? this.loadAddressesState,
      deleteAddressState: deleteAddressState ?? this.deleteAddressState,
      loadAddressesErrMsg: loadAddressesErrMsg ?? this.loadAddressesErrMsg,
      deleteAddressErrMsg: deleteAddressErrMsg ?? this.deleteAddressErrMsg,
      addressesList: addressesList ?? this.addressesList,
    );
  }

  @override
  List<Object?> get props => [
        loadAddressesState,
        deleteAddressState,
        loadAddressesErrMsg,
        deleteAddressErrMsg,
        addressesList,
      ];
}
