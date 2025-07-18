import '../../../domain/entities/new_address_response.dart';

class SaveAddressResponse {
  SaveAddressResponse({
    required this.message,
    required this.addresses,
  });

  final String? message;
  final List<AddressDto> addresses;

  factory SaveAddressResponse.fromJson(Map<String, dynamic> json){
    return SaveAddressResponse(
      message: json["message"],
      addresses: json["addresses"] == null ? [] : List<AddressDto>.from(json["addresses"]!.map((x) => AddressDto.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "addresses": addresses.map((x) => x.toJson()).toList(),
  };

}

class AddressDto {
  AddressDto({
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

  factory AddressDto.fromJson(Map<String, dynamic> json){
    return AddressDto(
      street: json["street"],
      phone: json["phone"],
      city: json["city"],
      lat: json["lat"],
      long: json["long"],
      username: json["username"],
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "street": street,
    "phone": phone,
    "city": city,
    "lat": lat,
    "long": long,
    "username": username,
    "_id": id,
  };

  AddressEntity toEntity() {
    return AddressEntity(
      street: street,
      phone: phone,
      city: city,
      lat: lat,
      long: long,
      username: username,
      id: id ?? "", // If id is null, you can set it to an empty string or handle as needed
    );
  }

}
