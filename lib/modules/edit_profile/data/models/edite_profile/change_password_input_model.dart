class ChangePasswordInputModel {
  String? password;
  String? newPassword;

  ChangePasswordInputModel({this.password, this.newPassword});

  ChangePasswordInputModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['newPassword'] = newPassword;
    return data;
  }
}
