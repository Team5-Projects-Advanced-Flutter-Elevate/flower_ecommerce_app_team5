// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDM _$CategoryDMFromJson(Map<String, dynamic> json) => CategoryDM(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      productsCount: json['productsCount'] as num?,
    );

Map<String, dynamic> _$CategoryDMToJson(CategoryDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'productsCount': instance.productsCount,
    };
