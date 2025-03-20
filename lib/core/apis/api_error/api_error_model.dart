class ApiErrorModel {
  String? message;
  int? code;

  ApiErrorModel({this.message, this.code});

  ApiErrorModel.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
  }
}