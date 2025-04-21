import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';

enum CheckOutStatus {
  initial,
  loading,
  success,
  error,
}

enum SelectAddressStatus {
  selected,
  unSelected,
}

class CheckOutState extends Equatable {
  final CheckOutStatus status;
  final Object? error;
  final AddressResponseEntity? addressesResponseEntity;
  String? selectedDeliveryAddress;
  String? selectedPaymentMethod;
  bool isGift;

  CheckOutState({
    this.status = CheckOutStatus.initial,
    this.error,
    this.addressesResponseEntity,
    this.selectedDeliveryAddress,
    this.selectedPaymentMethod,
    this.isGift = false,
  });

  CheckOutState copyWith({
    CheckOutStatus? status,
    Object? error,
    AddressResponseEntity? addressesResponseEntity,
    String? selectedDeliveryAddress,
    SelectAddressStatus? selectAddressStatus,
    String? selectedPaymentMethod,
    bool? isGift,
  }) {
    return CheckOutState(
      status: status ?? this.status,
      error: error ?? this.error,
      addressesResponseEntity:
          addressesResponseEntity ?? this.addressesResponseEntity,
      selectedDeliveryAddress:
          selectedDeliveryAddress ?? this.selectedDeliveryAddress,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      isGift: isGift ?? this.isGift,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        addressesResponseEntity,
        selectedDeliveryAddress,
        selectedPaymentMethod,
        isGift,
      ];
}
