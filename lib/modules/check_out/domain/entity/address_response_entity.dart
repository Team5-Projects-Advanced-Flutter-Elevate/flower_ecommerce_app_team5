import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';

class AddressResponseEntity {
  final String? message;
  final List<AddressEntity>? addresses;

  AddressResponseEntity({
    this.message,
    this.addresses,
  });

  AddressResponseEntity copyWith({
    String? message,
    List<AddressEntity>? addresses,
  }) {
    return AddressResponseEntity(
      message: message ?? this.message,
      addresses: addresses ?? this.addresses,
    );
  }
}
