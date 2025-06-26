import 'package:equatable/equatable.dart';

import '../../domain/entities/saved_address/saved_address_response_entity.dart';

enum AddressStatus { initial, loading, success, error }

class AddressState extends Equatable {
  final AddressStatus addressStatus;
  final SavedAddressResponseEntity? address;
  final Object? error;

  const AddressState({
    this.addressStatus = AddressStatus.initial,
    this.address,
    this.error,
  });

  AddressState copyWith({
    AddressStatus? addressStatus,
    SavedAddressResponseEntity? address,
    Object? error,
  }) {
    return AddressState(
      addressStatus: addressStatus ?? this.addressStatus,
      address: address ?? this.address,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [addressStatus, address, error];
}

