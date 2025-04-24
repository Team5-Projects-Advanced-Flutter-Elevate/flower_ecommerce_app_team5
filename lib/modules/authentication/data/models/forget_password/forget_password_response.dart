/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTE3NzU4ODM2ZWU4YmU3MDYyYjZjYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQyODI5NzI1fQ.ejKRJalBszaIsr_CnYc1AdcWTslaq3w7MH_b2xC5oQk"

class ForgetPasswordResponse {
  ForgetPasswordResponse({
    this.message,
    this.token,
    this.info
  });

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    info = json['info'];
  }
  String? message;
  String? token;
  String? info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    map['info'] = info;
    return map;
  }
}
