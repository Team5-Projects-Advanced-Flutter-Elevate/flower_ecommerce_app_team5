// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
    };
