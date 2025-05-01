import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';

enum LoadCheckoutAddressesStatus {
  initial,
  loading,
  success,
  error,
}

enum SelectAddressStatus {
  selected,
  unSelected,
}

enum MakeCashOnDeliveryStatus {
  initial,
  loading,
  success,
  error,
}

enum MakeCreditCardStatus {
  initial,
  loading,
  success,
  error,
}

enum SelectedPaymentMethod {
  cod,
  online,
}

extension SelectedPaymentMethodExtension on SelectedPaymentMethod {
  String get value =>
      this == SelectedPaymentMethod.cod ? 'Cash on delivery' : 'Credit card';
}

// ignore: must_be_immutable
class CheckOutState extends Equatable {
  final LoadCheckoutAddressesStatus status;
  final MakeCashOnDeliveryStatus makeCashOnDeliveryStatus;
  final MakeCreditCardStatus makeCreditCardStatus;
  final Object? error;
  AddressResponseEntity? addressesResponseEntity;
  final AddressModelEntity? addressModelEntityOfSelectedAddress;
  String? selectedDeliveryAddress;
  final int rebuildKey;

  SelectedPaymentMethod? selectedPaymentMethod;
  bool isGift;

  CheckOutState({
    this.status = LoadCheckoutAddressesStatus.initial,
    this.makeCashOnDeliveryStatus = MakeCashOnDeliveryStatus.initial,
    this.makeCreditCardStatus = MakeCreditCardStatus.initial,
    this.error,
    this.addressesResponseEntity,
    this.selectedDeliveryAddress,
    this.selectedPaymentMethod,
    this.isGift = false,
    this.addressModelEntityOfSelectedAddress,
    this.rebuildKey = 0,
  });

  CheckOutState copyWith({
    LoadCheckoutAddressesStatus? status,
    MakeCashOnDeliveryStatus? makeCashOnDeliveryStatus,
    MakeCreditCardStatus? makeCreditCardStatus,
    Object? error,
    AddressResponseEntity? addressesResponseEntity,
    String? selectedDeliveryAddress,
    SelectAddressStatus? selectAddressStatus,
    SelectedPaymentMethod? selectedPaymentMethod,
    bool? isGift,
    AddressModelEntity? addressModelEntityOfSelectedAddress,
    int? rebuildKey,
  }) {
    return CheckOutState(
      status: status ?? this.status,
      makeCashOnDeliveryStatus:
          makeCashOnDeliveryStatus ?? this.makeCashOnDeliveryStatus,
      makeCreditCardStatus: makeCreditCardStatus ?? this.makeCreditCardStatus,
      error: error ?? this.error,
      addressesResponseEntity:
          addressesResponseEntity ?? this.addressesResponseEntity,
      selectedDeliveryAddress:
          selectedDeliveryAddress ?? this.selectedDeliveryAddress,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      isGift: isGift ?? this.isGift,
      addressModelEntityOfSelectedAddress:
          addressModelEntityOfSelectedAddress ??
              this.addressModelEntityOfSelectedAddress,
      rebuildKey: rebuildKey ?? this.rebuildKey,
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
        makeCashOnDeliveryStatus,
        addressModelEntityOfSelectedAddress,
        makeCreditCardStatus,
        rebuildKey,
      ];
}
