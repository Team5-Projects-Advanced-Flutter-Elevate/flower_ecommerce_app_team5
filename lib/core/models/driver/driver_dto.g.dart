// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverDto _$DriverDtoFromJson(Map<String, dynamic> json) => DriverDto(
      id: json['_id'] as String?,
      country: json['country'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      vehicleLicense: json['vehicleLicense'] as String?,
      nid: json['NID'] as String?,
      nIDImg: json['NIDImg'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] as String?,
      isCanceled: json['isCanceled'] as bool?,
    );

Map<String, dynamic> _$DriverDtoToJson(DriverDto instance) => <String, dynamic>{
      if (instance.id case final value?) '_id': value,
      if (instance.country case final value?) 'country': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.vehicleType case final value?) 'vehicleType': value,
      if (instance.vehicleNumber case final value?) 'vehicleNumber': value,
      if (instance.vehicleLicense case final value?) 'vehicleLicense': value,
      if (instance.nid case final value?) 'NID': value,
      if (instance.nIDImg case final value?) 'NIDImg': value,
      if (instance.email case final value?) 'email': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.photo case final value?) 'photo': value,
      if (instance.role case final value?) 'role': value,
      if (instance.createdAt case final value?) 'createdAt': value,
      if (instance.isCanceled case final value?) 'isCanceled': value,
    };
