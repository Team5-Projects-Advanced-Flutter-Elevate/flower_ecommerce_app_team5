import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_dm.g.dart';

@JsonSerializable()
class CategoryDM {
  CategoryDM({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
  });

  factory CategoryDM.fromJson(dynamic json) => _$CategoryDMFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? productsCount;

  Map<String, dynamic> toJson() => _$CategoryDMToJson(this);

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
        slug: slug,
        image: image,
        createdAt: createdAt,
        updatedAt: updatedAt,
        productsCount: productsCount,
      );
}
