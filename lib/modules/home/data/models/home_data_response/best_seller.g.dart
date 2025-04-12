// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerDM _$BestSellerDMFromJson(Map<String, dynamic> json) => BestSellerDM(
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
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['v'] as num?,
      discount: json['discount'] as num?,
      sold: json['sold'] as num?,
      rateAvg: json['rateAvg'] as num?,
      rateCount: json['rateCount'] as num?,
    );

Map<String, dynamic> _$BestSellerDMToJson(BestSellerDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
      'discount': instance.discount,
      'sold': instance.sold,
      'rateAvg': instance.rateAvg,
      'rateCount': instance.rateCount,
    };
