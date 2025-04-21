import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'payment_request_parameters.g.dart';

/// shippingAddress : {"street":"details","phone":"01010800921","city":"Cairo","lat":"String","long":"String"}

@JsonSerializable(createFactory: false)
class PaymentRequestParametersDto {
  PaymentRequestParametersDto({
    required this.shippingAddress,
  });

  ShippingAddressDto shippingAddress;

  Map<String, dynamic> toJson() => _$PaymentRequestParametersDtoToJson(this);

  static PaymentRequestParametersDto convertEntityIntoDto(
      PaymentRequestParametersEntity entity) {
    return PaymentRequestParametersDto(
        shippingAddress:
            ShippingAddressDto.convertEntityIntoDto(entity.shippingAddress));
  }
}

/// street : "details"
/// phone : "01010800921"
/// city : "Cairo"
/// lat : "String"
/// long : "String"

@JsonSerializable(createFactory: false)
class ShippingAddressDto {
  ShippingAddressDto({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
  });

  String street;
  String phone;
  String city;
  String lat;
  String long;

  Map<String, dynamic> toJson() => _$ShippingAddressDtoToJson(this);

  static ShippingAddressDto convertEntityIntoDto(ShippingAddressEntity entity) {
    return ShippingAddressDto(
        street: entity.street,
        phone: entity.phone,
        city: entity.city,
        lat: entity.lat,
        long: entity.long);
  }
}
