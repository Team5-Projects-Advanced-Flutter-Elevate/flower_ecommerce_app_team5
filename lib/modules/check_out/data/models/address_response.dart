import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'address_model.dart';

part 'address_response.g.dart';

@JsonSerializable()
class AddressResponse {
  final String? message;
  final List<AddressModel>? addresses;

  AddressResponse({
    this.message,
    this.addresses,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);

  AddressResponseEntity toEntity() => AddressResponseEntity(
        addresses: addresses?.map((e) => e.toEntity()).toList(),
        message: message,
      );
}
