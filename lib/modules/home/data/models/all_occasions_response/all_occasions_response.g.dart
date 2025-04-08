// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_occasions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllOccasionsResponse _$AllOccasionsResponseFromJson(
        Map<String, dynamic> json) =>
    AllOccasionsResponse(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null ? null : Metadata.fromJson(json['metadata']),
      categories: (json['categories'] as List<dynamic>?)
          ?.map(OccasionDM.fromJson)
          .toList(),
    );

Map<String, dynamic> _$AllOccasionsResponseToJson(
        AllOccasionsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'categories': instance.categories,
    };
