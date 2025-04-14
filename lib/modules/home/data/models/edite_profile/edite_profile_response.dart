class EditProfileResponse {
  String? message;
  User? user;

  EditProfileResponse({this.message, this.user});

  EditProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  String? createdAt;
  String? passwordChangedAt;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.gender,
      this.phone,
      this.photo,
      this.role,
      this.createdAt,
      this.passwordChangedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    role = json['role'];
    createdAt = json['createdAt'];
    passwordChangedAt = json['passwordChangedAt'];
  }
}
