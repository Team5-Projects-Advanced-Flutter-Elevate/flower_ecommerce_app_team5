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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
