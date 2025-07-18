import '../../domain/entities/saved_address_entity.dart';

class SavedAddressDto {
  SavedAddressDto({
    required this.message,
    required this.addresses,
  });

  final String? message;
  final List<Address> addresses;

  factory SavedAddressDto.fromJson(Map<String, dynamic> json) {
    return SavedAddressDto(
      message: json["message"],
      addresses: json["addresses"] == null
          ? []
          : List<Address>.from(
              json["addresses"]!.map((x) => Address.fromJson(x))),
    );
  }
}

class Address {
  Address({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
    required this.username,
    required this.id,
  });

  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  final String? id;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json["street"],
      phone: json["phone"],
      city: json["city"],
      lat: json["lat"],
      long: json["long"],
      username: json["username"],
      id: json["_id"],
    );
  }

  SavedAddressEntity toEntity() {
    return SavedAddressEntity(
      street: street,
      phone: phone,
      city: city,
      lat: lat,
      long: long,
      username: username,
      id: id ??
          "", // If id is null, you can set it to an empty string or handle as needed
    );
  }
}
