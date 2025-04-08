// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasion_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionDM _$OccasionDMFromJson(Map<String, dynamic> json) => OccasionDM(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      productsCount: json['productsCount'] as num?,
    );

Map<String, dynamic> _$OccasionDMToJson(OccasionDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'productsCount': instance.productsCount,
    };
