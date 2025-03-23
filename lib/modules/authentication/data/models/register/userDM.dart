import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/user_entity.dart';

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

  UserDM.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    role = json['role'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }

  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  String? id;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['role'] = role;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }

  UserEntity toEntity() => UserEntity(
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        phone: phone,
        id: id,
      );
}
