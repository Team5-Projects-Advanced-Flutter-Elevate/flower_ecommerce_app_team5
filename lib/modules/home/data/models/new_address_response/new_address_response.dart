import '../../../domain/entities/new_address_response.dart';

class SaveAddress {
  SaveAddress({
    required this.message,
    required this.addresses,
  });

  final String? message;
  final List<Address> addresses;

  factory SaveAddress.fromJson(Map<String, dynamic> json){
    return SaveAddress(
      message: json["message"],
      addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "addresses": addresses.map((x) => x.toJson()).toList(),
  };

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

  factory Address.fromJson(Map<String, dynamic> json){
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
