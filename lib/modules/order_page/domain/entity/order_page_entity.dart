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

  final int? currentPage;
  final int? totalPages;
  final int? limit;
  final int? totalItems;
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
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? orderNumber;
  final int? v;
}

class OrderItemEntity {
  const OrderItemEntity({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });

  final ProductEntity? product;
  final int? price;
  final int? quantity;
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

  final int? rateAvg;
  final int? rateCount;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String> images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? sold;
  final int? discount;
  final String? productId;
}
