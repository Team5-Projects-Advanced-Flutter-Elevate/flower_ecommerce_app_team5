import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'occasion_dm.g.dart';

@JsonSerializable()
class OccasionDM {
  OccasionDM({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
  });

  factory OccasionDM.fromJson(dynamic json) => _$OccasionDMFromJson(json);
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? productsCount;

  Map<String, dynamic> toJson() => _$OccasionDMToJson(this);

  OccasionEntity toEntity() => OccasionEntity(
        id: id,
        name: name,
        slug: slug,
        image: image,
        createdAt: createdAt,
        updatedAt: updatedAt,
        productsCount: productsCount,
      );
}
