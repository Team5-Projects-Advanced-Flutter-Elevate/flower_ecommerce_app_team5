class ApiErrorModel {
  ApiErrorModel({
    required this.error,
  });

  final String? error;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    var keys = json.keys.toList();
    return ApiErrorModel(
      error: json[keys.isNotEmpty ? keys.first : ""],
    );
  }

  @override
  String toString() {
    return "$error, ";
  }
}
