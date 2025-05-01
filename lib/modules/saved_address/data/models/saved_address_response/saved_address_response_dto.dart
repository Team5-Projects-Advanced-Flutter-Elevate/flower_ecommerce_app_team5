import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/saved_address/saved_address_response_entity.dart';

part 'saved_address_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class SavedAddressResponseDto extends Equatable {
  SavedAddressResponseDto({
    required this.message,
    required this.addresses,
  });

  final String? message;
  static const String messageKey = "message";

  final List<Address>? addresses;
  static const String addressesKey = "addresses";


  factory SavedAddressResponseDto.fromJson(Map<String, dynamic> json) => _$SavedAddressResponseDtoFromJson(json);

  @override
  List<Object?> get props => [
    message, addresses, ];
  SavedAddressResponseEntity convertToEntity(){
    return SavedAddressResponseEntity(
      address: addresses?.map((e) => e.convertToEntity(),).toList(),
      message: message,
    );
  }
}

@JsonSerializable(createToJson: false)
class Address extends Equatable {
  const Address({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
    required this.username,
    required this.id,
  });

  final String? street;
  static const String streetKey = "street";

  final String? phone;
  static const String phoneKey = "phone";

  final String? city;
  static const String cityKey = "city";

  final String? lat;
  static const String latKey = "lat";

  final String? long;
  static const String longKey = "long";

  final String? username;
  static const String usernameKey = "username";


  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";


  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  @override
  List<Object?> get props => [
    street, phone, city, lat, long, username, id, ];
  AddressEntity convertToEntity(){
    return AddressEntity(
        city: city,
        lat: lat,
        long: long,
        street: street,
        username: username,
        phone: phone
    );
  }
}

class AddressEntity{

  AddressEntity({this.id,this.city, this.lat, this.long, this.street, this.username, this.phone});
  final String? id;
  static const String idKey = "id";

  final String? street;
  static const String streetKey = "street";

  final String? phone;
  static const String phoneKey = "phone";

  final String? city;
  static const String cityKey = "city";

  final String? lat;
  static const String latKey = "lat";

  final String? long;
  static const String longKey = "long";

  final String? username;
  static const String usernameKey = "username";
}



// SavedAddressResponseDto
