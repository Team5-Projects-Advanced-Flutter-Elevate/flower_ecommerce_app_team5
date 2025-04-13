// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerResponseDto _$BestSellerResponseDtoFromJson(
        Map<String, dynamic> json) =>
    BestSellerResponseDto(
      message: json['message'] as String?,
      bestSellerProducts: (json['bestSeller'] as List<dynamic>?)
          ?.map((e) => BestSellerDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

BestSellerDataDto _$BestSellerDataDtoFromJson(Map<String, dynamic> json) =>
    BestSellerDataDto(
      id: json['id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      imgCover: json['imgCover'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as num?,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      quantity: json['quantity'] as num?,
      category: json['category'] as String?,
      occasion: json['occasion'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['v'] as num?,
      discount: json['discount'] as num?,
      sold: json['sold'] as num?,
      rateAvg: json['rateAvg'] as num?,
      rateCount: json['rateCount'] as num?,
      bestSellerId: json['bestSellerId'] as String?,
    );
