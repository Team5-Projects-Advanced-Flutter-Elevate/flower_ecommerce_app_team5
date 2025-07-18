class Governorate {
  final String id;
  final String nameAr;
  final String nameEn;

  Governorate({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      id: json['id'],
      nameAr: json['governorate_name_ar'],
      nameEn: json['governorate_name_en'],
    );
  }
}
