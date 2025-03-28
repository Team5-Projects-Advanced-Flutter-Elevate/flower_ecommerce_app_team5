// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCategoriesResponse _$AllCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    AllCategoriesResponse(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null ? null : Metadata.fromJson(json['metadata']),
      categories: (json['categories'] as List<dynamic>?)
          ?.map(CategoryDM.fromJson)
          .toList(),
    );

Map<String, dynamic> _$AllCategoriesResponseToJson(
        AllCategoriesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'categories': instance.categories,
    };
