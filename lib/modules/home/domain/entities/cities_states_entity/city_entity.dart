class City {
  final String id;
  final String governorateId;
  final String cityNameAr;
  final String cityNameEn;

  City({
    required this.id,
    required this.governorateId,
    required this.cityNameAr,
    required this.cityNameEn,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] ?? '',
      governorateId: json['governorate_id'] ?? '',
      cityNameAr: json['city_name_ar'] ?? '',
      cityNameEn: json['city_name_en'] ?? '',
    );
  }
}
