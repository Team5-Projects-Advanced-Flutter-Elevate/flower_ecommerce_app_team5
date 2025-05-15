import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity.dart';

import '../../../../core/entities/order/order_entity_firestore.dart';

class GetMyOrdersEntity {
  const GetMyOrdersEntity({
    required this.message,
    required this.metadata,
    required this.orderEntities,
  });

  final String? message;
  final MetadataEntity? metadata;
  final List<OrderEntity> orderEntities;
}

class MetadataEntity {
  const MetadataEntity({
    required this.currentPage,
    required this.totalPages,
    required this.limit,
    required this.totalItems,
  });

  final num? currentPage;
  final num? totalPages;
  final num? limit;
  final num? totalItems;
}
