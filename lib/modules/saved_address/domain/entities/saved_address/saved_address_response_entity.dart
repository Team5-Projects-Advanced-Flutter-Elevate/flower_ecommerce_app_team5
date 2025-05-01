import 'package:equatable/equatable.dart';

import '../../../data/models/saved_address_response/saved_address_response_dto.dart';

class SavedAddressResponseEntity extends Equatable {
  const SavedAddressResponseEntity({
    required this.message,
    required this.address,
  });
final String? message;
static const String messageKey = "message";

final List<AddressEntity>? address;
static const String addressKey = "address";

  @override
  List<Object?> get props => [];
}


//import 'package:equatable/equatable.dart';
//
// class NotificationListResponseEntityDto extends Equatable {
//     NotificationListResponseEntityDto({
//         required this.addresses,
//     });
//
//     final List<Address> addresses;
//     static const String addressesKey = "addresses";
//
//
//     factory NotificationListResponseEntityDto.fromJson(Map<String, dynamic> json){
//         return NotificationListResponseEntityDto(
//             addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
//         );
//     }
//
//     @override
//     List<Object?> get props => [
//     addresses, ];
// }
//
// class Address extends Equatable {
//     Address({
//         required this.street,
//         required this.phone,
//         required this.city,
//         required this.lat,
//         required this.long,
//         required this.username,
//         required this.id,
//     });
//
//     final String? street;
//     static const String streetKey = "street";
//
//     final String? phone;
//     static const String phoneKey = "phone";
//
//     final String? city;
//     static const String cityKey = "city";
//
//     final String? lat;
//     static const String latKey = "lat";
//
//     final String? long;
//     static const String longKey = "long";
//
//     final String? username;
//     static const String usernameKey = "username";
//
//     final String? id;
//     static const String idKey = "_id";
//
//
//     factory Address.fromJson(Map<String, dynamic> json){
//         return Address(
//             street: json["street"],
//             phone: json["phone"],
//             city: json["city"],
//             lat: json["lat"],
//             long: json["long"],
//             username: json["username"],
//             id: json["_id"],
//         );
//     }
//
//     @override
//     List<Object?> get props => [
//     street, phone, city, lat, long, username, id, ];
// }