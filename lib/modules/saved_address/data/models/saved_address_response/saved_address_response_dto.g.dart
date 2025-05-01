// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_address_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedAddressResponseDto _$SavedAddressResponseDtoFromJson(
        Map<String, dynamic> json) =>
    SavedAddressResponseDto(
      message: json['message'] as String?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      username: json['username'] as String?,
      id: json['_id'] as String?,
    );
