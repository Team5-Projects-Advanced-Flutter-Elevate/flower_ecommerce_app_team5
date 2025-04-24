import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';

class AddressResponseEntity {
  final String? message;
  final List<AddressModelEntity>? addresses;

  AddressResponseEntity({
    this.message,
    this.addresses,
  });
}