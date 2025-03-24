import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userDM.g.dart';

@JsonSerializable()
class UserDM {
  UserDM({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.id,
    this.createdAt,
  });

  factory UserDM.fromJson(dynamic json) => _$UserDMFromJson(json);

  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  String? id;
  String? createdAt;

  Map<String, dynamic> toJson() => _$UserDMToJson(this);

  UserEntity toEntity() => UserEntity(
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        phone: phone,
        id: id,
      );
}
