
abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {}

class AddressError extends AddressState {
  final String errorMessage;

  AddressError(this.errorMessage);
}
