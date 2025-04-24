import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_request_parameters.g.dart';

/// shippingAddress : {"street":"details","phone":"01010800921","city":"Cairo","lat":"String","long":"String"}

@JsonSerializable(createFactory: false)
class PaymentRequestParametersDto extends Equatable {
  const PaymentRequestParametersDto({
    required this.shippingAddress,
  });

  final ShippingAddressDto shippingAddress;

  Map<String, dynamic> toJson() => _$PaymentRequestParametersDtoToJson(this);

  static PaymentRequestParametersDto convertEntityIntoDto(
      PaymentRequestParametersEntity entity) {
    return PaymentRequestParametersDto(
        shippingAddress:
            ShippingAddressDto.convertEntityIntoDto(entity.shippingAddress));
  }

  @JsonKey(includeToJson: false)
  @override
  List<Object?> get props => [shippingAddress];

  @JsonKey(includeToJson: false)
  @override
  bool? get stringify => super.stringify;

  @JsonKey(includeToJson: false)
  @override
  int get hashCode => super.hashCode;
}

/// street : "details"
/// phone : "01010800921"
/// city : "Cairo"
/// lat : "String"
/// long : "String"

@JsonSerializable(createFactory: false)
class ShippingAddressDto extends Equatable {
  const ShippingAddressDto({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
  });

  final String street;
  final String phone;
  final String city;
  final String lat;
  final String long;

  Map<String, dynamic> toJson() => _$ShippingAddressDtoToJson(this);

  static ShippingAddressDto convertEntityIntoDto(ShippingAddressEntity entity) {
    return ShippingAddressDto(
        street: entity.street,
        phone: entity.phone,
        city: entity.city,
        lat: entity.lat,
        long: entity.long);
  }

  @JsonKey(includeToJson: false)
  @override
  List<Object?> get props => [street, phone, city, long, lat];

  @JsonKey(includeToJson: false)
  @override
  bool? get stringify => super.stringify;

  @JsonKey(includeToJson: false)
  @override
  int get hashCode => super.hashCode;
}
