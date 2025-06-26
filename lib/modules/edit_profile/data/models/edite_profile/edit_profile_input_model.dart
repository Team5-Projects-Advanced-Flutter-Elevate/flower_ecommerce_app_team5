class EditProfileInputModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  EditProfileInputModel(
      {this.firstName, this.lastName, this.email, this.phone});

  EditProfileInputModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (firstName != null) data['firstName'] = firstName;
    if (lastName != null) data['lastName'] = lastName;
    if (email != null) data['email'] = email;
    if (phone != null) data['phone'] = phone;
    return data;
  }
}
