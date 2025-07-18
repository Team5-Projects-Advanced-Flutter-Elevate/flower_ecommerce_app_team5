import 'package:equatable/equatable.dart';

enum Status { idle, loading, success, error }

class UpdateAddressState extends Equatable {
  final Status initializingDataStatus;
  final Status updateAddressStatus;
  final Object? initializingDataError;
  final Object? updateAddressError;
  const UpdateAddressState(
      {this.initializingDataStatus = Status.idle,
      this.updateAddressStatus = Status.idle,
      this.initializingDataError,
      this.updateAddressError});
  @override
  List<Object?> get props => [
        initializingDataStatus,
        updateAddressStatus,
        initializingDataError,
        updateAddressError
      ];

  UpdateAddressState copyWith(
      {Status? initializingDataStatus,
      Status? updateAddressStatus,
      Object? initializingDataError,
      Object? updateAddressError}) {
    return UpdateAddressState(
        initializingDataStatus:
            initializingDataStatus ?? this.initializingDataStatus,
        updateAddressStatus: updateAddressStatus ?? this.updateAddressStatus,
        updateAddressError: updateAddressError ?? this.updateAddressError,
        initializingDataError:
            initializingDataError ?? this.initializingDataError);
  }
}
