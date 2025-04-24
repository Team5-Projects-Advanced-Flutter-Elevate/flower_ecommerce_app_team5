import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/user_dto.dart';

class LoginResponseDto {
  String? message;
  UserDto? user;
  String? token;

  LoginResponseDto({this.message, this.user, this.token});

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}


class Address {
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? username;
  String? sId;

  Address({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.sId,
  });

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    username = json['username'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['phone'] = phone;
    data['city'] = city;
    data['lat'] = lat;
    data['long'] = long;
    data['username'] = username;
    data['_id'] = sId;
    return data;
  }
}
