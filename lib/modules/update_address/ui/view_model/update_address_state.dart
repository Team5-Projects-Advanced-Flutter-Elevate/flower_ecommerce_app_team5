import 'package:equatable/equatable.dart';

enum Status { idle, loading, success, error }

class UpdateAddressState extends Equatable {
  final Status initializingDataStatus;
  final Object? initializingDataError;
  const UpdateAddressState(
      {this.initializingDataStatus = Status.idle, this.initializingDataError});
  @override
  List<Object?> get props => [initializingDataStatus, initializingDataError];

  UpdateAddressState copyWith(
      {Status? initializingDataStatus, Object? initializingDataError}) {
    return UpdateAddressState(
        initializingDataStatus:
            initializingDataStatus ?? this.initializingDataStatus,
        initializingDataError:
            initializingDataError ?? this.initializingDataError);
  }
}
