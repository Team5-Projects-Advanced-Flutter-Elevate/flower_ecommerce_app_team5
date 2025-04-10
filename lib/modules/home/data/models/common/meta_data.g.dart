// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      currentPage: json['currentPage'] as num?,
      limit: json['limit'] as num?,
      totalPages: json['totalPages'] as num?,
      totalItems: json['totalItems'] as num?,
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };
