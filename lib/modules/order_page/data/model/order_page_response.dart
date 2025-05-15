import 'package:flower_ecommerce_app_team5/modules/payment/data/models/cash_order_response/cash_order_response_dto.dart';
import '../../../../core/models/order/order_dto.dart';
import '../../domain/entity/order_page_entity.dart';

class GetMyOrders {
  GetMyOrders({
    required this.message,
    required this.metadata,
    required this.orders,
  });

  final String? message;
  final Metadata? metadata;
  final List<OrderDto> orders;

  factory GetMyOrders.fromJson(Map<String, dynamic> json) {
    return GetMyOrders(
      message: json["message"],
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      orders: json["orders"] == null
          ? []
          : List<OrderDto>.from(
              json["orders"]!.map((x) => OrderDto.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "metadata": metadata?.toJson(),
        "orders": orders.map((x) => x.toJson()).toList(),
      };

  GetMyOrdersEntity toEntity() => GetMyOrdersEntity(
        message: message,
        metadata: metadata?.toEntity(),
        orderEntities: orders.map((e) => e.convertIntoEntity()).toList(),
      );
}

class Metadata {
  Metadata({
    required this.currentPage,
    required this.totalPages,
    required this.limit,
    required this.totalItems,
  });

  final num? currentPage;
  final num? totalPages;
  final num? limit;
  final num? totalItems;

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json["currentPage"],
      totalPages: json["totalPages"],
      limit: json["limit"],
      totalItems: json["totalItems"],
    );
  }

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "totalPages": totalPages,
        "limit": limit,
        "totalItems": totalItems,
      };

  MetadataEntity toEntity() => MetadataEntity(
        currentPage: currentPage,
        totalPages: totalPages,
        limit: limit,
        totalItems: totalItems,
      );
}
