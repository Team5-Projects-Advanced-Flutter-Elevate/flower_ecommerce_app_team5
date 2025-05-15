// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashOrderResponseDto _$CashOrderResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CashOrderResponseDto(
      message: json['message'] as String?,
      order: json['order'] == null
          ? null
          : OrderDto.fromJson(json['order'] as Map<String, dynamic>),
    );
