// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      message: json['message'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map(CategoryDM.fromJson)
          .toList(),
      bestSeller: (json['bestSeller'] as List<dynamic>?)
          ?.map(ProductDto.fromJson)
          .toList(),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map(OccasionDM.fromJson)
          .toList(),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'categories': instance.categories,
      'bestSeller': instance.bestSeller,
      'occasions': instance.occasions,
    };
