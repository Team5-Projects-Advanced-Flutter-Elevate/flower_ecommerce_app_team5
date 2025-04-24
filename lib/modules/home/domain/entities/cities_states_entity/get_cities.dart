class GetCities {
  final String id;
  final String nameAr;
  final String nameEn;

  GetCities({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory GetCities.fromJson(Map<String, dynamic> json) {
    return GetCities(
      id: json['id'],
      nameAr: json['governorate_name_ar'],
      nameEn: json['governorate_name_en'],
    );
  }
}
