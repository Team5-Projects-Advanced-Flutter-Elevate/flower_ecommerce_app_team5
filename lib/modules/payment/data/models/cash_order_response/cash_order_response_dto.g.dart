// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashOrderResponseDto _$CashOrderResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CashOrderResponseDto(
      message: json['message'] as String?,
      order: json['order'] == null ? null : OrderDto.fromJson(json['order']),
    );

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      user: json['user'] as String?,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map(OrderItemDto.fromJson)
          .toList(),
      totalPrice: json['totalPrice'] as num?,
      paymentType: json['paymentType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      state: json['state'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      orderNumber: json['orderNumber'] as String?,
      v: json['v'] as num?,
    );

OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) => OrderItemDto(
      product:
          json['product'] == null ? null : ProductDto.fromJson(json['product']),
      price: json['price'] as num?,
      quantity: json['quantity'] as num?,
      id: json['id'] as String?,
    );
