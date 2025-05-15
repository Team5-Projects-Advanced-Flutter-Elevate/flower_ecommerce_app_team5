import 'package:flower_ecommerce_app_team5/core/models/order_item/order_item_dto.dart';

import '../../entities/order/order_entity.dart';

class OrderDto {
  OrderDto({
    required this.id,
    required this.user,
    required this.orderItems,
    required this.totalPrice,
    required this.paymentType,
    required this.isPaid,
    required this.isDelivered,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.orderNumber,
    required this.v,
  });

  final String? id;
  final String? user;
  final List<OrderItemDto> orderItems;
  final num? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final num? v;

  factory OrderDto.fromJson(Map<String, dynamic> json) {
    return OrderDto(
      id: json["_id"],
      user: json["user"],
      orderItems: json["orderItems"] == null
          ? []
          : List<OrderItemDto>.from(
          json["orderItems"]!.map((x) => OrderItemDto.fromJson(x))),
      totalPrice: json["totalPrice"],
      paymentType: json["paymentType"],
      isPaid: json["isPaid"],
      isDelivered: json["isDelivered"],
      state: json["state"],
      createdAt: json["createdAt"] ,
      updatedAt: json["updatedAt"] ,
      orderNumber: json["orderNumber"],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "orderItems": orderItems.map((x) => x.toJson()).toList(),
    "totalPrice": totalPrice,
    "paymentType": paymentType,
    "isPaid": isPaid,
    "isDelivered": isDelivered,
    "state": state,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "orderNumber": orderNumber,
    "__v": v,
  };

  OrderEntity convertIntoEntity() => OrderEntity(
    id: id,
    user: user,
    orderItems: orderItems.map((e) => e.convertIntoEntity()).toList(),
    totalPrice: totalPrice,
    paymentType: paymentType,
    isPaid: isPaid,
    isDelivered: isDelivered,
    state: state,
    createdAt: createdAt,
    updatedAt: updatedAt,
    orderNumber: orderNumber,
    v: v,
  );
}