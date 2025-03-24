// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDM _$UserDMFromJson(Map<String, dynamic> json) => UserDM(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      role: json['role'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$UserDMToJson(UserDM instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      'id': instance.id,
      'createdAt': instance.createdAt,
    };
