class GetMyOrdersEntity {
  const GetMyOrdersEntity({
    required this.message,
    required this.metadata,
    required this.orders,
  });

  final String? message;
  final MetadataEntity? metadata;
  final List<OrderEntity> orders;
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

class OrderEntity {
  const OrderEntity({
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
  final List<OrderItemEntity> orderItems;
  final num? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? orderNumber;
  final num? v;
}

class OrderItemEntity {
  const OrderItemEntity({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });

  final ProductEntity? product;
  final num? price;
  final num? quantity;
  final String? id;
}

class ProductEntity {
  const ProductEntity({
    required this.rateAvg,
    required this.rateCount,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.sold,
    required this.discount,
    required this.productId,
  });

  final num? rateAvg;
  final num? rateCount;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String> images;
  final num? price;
  final num? priceAfterDiscount;
  final num? quantity;
  final String? category;
  final String? occasion;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;
  final num? sold;
  final num? discount;
  final String? productId;
}
