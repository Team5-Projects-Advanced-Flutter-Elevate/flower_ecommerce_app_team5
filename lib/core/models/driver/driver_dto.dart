import 'package:json_annotation/json_annotation.dart';
import '../../entities/driver/driver_entity.dart';
part 'driver_dto.g.dart';

/// _id : "681c9af21433a666c8da4d98"
/// country : "Egypt"
/// firstName : "Mohammed"
/// lastName : "Khalil"
/// vehicleType : "676b31a45d05310ca82657ac"
/// vehicleNumber : "12221"
/// vehicleLicense : "https://flower.elevateegy.com/uploads/486c5a67-6911-477f-be80-67aa9f7627da-0*e6QF0vjUGkiKSm06.png"
/// NID : "12345678912345"
/// NIDImg : "https://flower.elevateegy.com/uploads/39a39855-0371-438d-b24a-4d1a84033863-0*e6QF0vjUGkiKSm06.png"
/// email : "klilmohammed9@gmail.com"
/// gender : "male"
/// phone : "+201010700888"
/// photo : "https://flower.elevateegy.com/uploads/default-profile.png"
/// role : "driver"
/// createdAt : "2025-05-08T11:52:18.050Z"
@JsonSerializable(includeIfNull: false)
class DriverDto {
  DriverDto({
    this.id,
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nIDImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.createdAt,
    this.isCanceled,
  });

  factory DriverDto.fromJson(dynamic json) => _$DriverDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DriverDtoToJson(this);
  @JsonKey(name: '_id')
  String? id;
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  @JsonKey(name: 'NID')
  String? nid;
  @JsonKey(name: 'NIDImg')
  String? nIDImg;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  String? createdAt;
  bool? isCanceled;

  DriverEntity convertIntoEntity() {
    return DriverEntity(
      id: id,
      country: country,
      firstName: firstName,
      lastName: lastName,
      vehicleType: vehicleType,
      vehicleNumber: vehicleNumber,
      vehicleLicense: vehicleLicense,
      nid: nid,
      nIDImg: nIDImg,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
      createdAt: createdAt,
      isCanceled: isCanceled,
    );
  }

  static DriverDto convertIntoDto(DriverEntity? entity) {
    return DriverDto(
      id: entity?.id,
      country: entity?.country,
      firstName: entity?.firstName,
      lastName: entity?.lastName,
      vehicleType: entity?.vehicleType,
      vehicleNumber: entity?.vehicleNumber,
      vehicleLicense: entity?.vehicleLicense,
      nid: entity?.nid,
      nIDImg: entity?.nIDImg,
      email: entity?.email,
      gender: entity?.gender,
      phone: entity?.phone,
      photo: entity?.photo,
      role: entity?.role,
      createdAt: entity?.createdAt,
      isCanceled: entity?.isCanceled,
    );
  }
}
