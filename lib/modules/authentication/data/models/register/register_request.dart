class RegisterRequest {
  RegisterRequest({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.password, 
      this.rePassword, 
      this.phone, 
      this.gender,});

  RegisterRequest.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phone = json['phone'];
    gender = json['gender'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;
  String? gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    map['gender'] = gender;
    return map;
  }

}