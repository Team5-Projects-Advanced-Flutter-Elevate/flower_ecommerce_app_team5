class SaveAddressResponseEntity {
  SaveAddressResponseEntity({
    required this.message,
    required this.addresses,
  });

  final String? message;
  final List<AddressEntity> addresses;
}

class AddressEntity {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  final String? id;

  const AddressEntity({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });
}
