import '../../domain/entity/order_page_entity.dart';

class GetMyOrders {
  GetMyOrders({
    required this.message,
    required this.metadata,
    required this.orders,
  });

  final String? message;
  final Metadata? metadata;
  final List<Order> orders;

  factory GetMyOrders.fromJson(Map<String, dynamic> json) {
    return GetMyOrders(
      message: json["message"],
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      orders: json["orders"] == null
          ? []
          : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
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
        orders: orders.map((e) => e.toEntity()).toList(),
      );
}

class Metadata {
  Metadata({
    required this.currentPage,
    required this.totalPages,
    required this.limit,
    required this.totalItems,
  });

  final int? currentPage;
  final int? totalPages;
  final int? limit;
  final int? totalItems;

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

class Order {
  Order({
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
  final List<OrderItem> orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? orderNumber;
  final int? v;

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["_id"],
      user: json["user"],
      orderItems: json["orderItems"] == null
          ? []
          : List<OrderItem>.from(
              json["orderItems"]!.map((x) => OrderItem.fromJson(x))),
      totalPrice: json["totalPrice"],
      paymentType: json["paymentType"],
      isPaid: json["isPaid"],
      isDelivered: json["isDelivered"],
      state: json["state"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "orderNumber": orderNumber,
        "__v": v,
      };

  OrderEntity toEntity() => OrderEntity(
        id: id,
        user: user,
        orderItems: orderItems.map((e) => e.toEntity()).toList(),
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

class OrderItem {
  OrderItem({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });

  final Product? product;
  final int? price;
  final int? quantity;
  final String? id;

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      product:
          json["product"] == null ? null : Product.fromJson(json["product"]),
      price: json["price"],
      quantity: json["quantity"],
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "price": price,
        "quantity": quantity,
        "_id": id,
      };

  OrderItemEntity toEntity() => OrderItemEntity(
        product: product?.toEntity(),
        price: price,
        quantity: quantity,
        id: id,
      );
}

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      rateAvg: json["rateAvg"],
      rateCount: json["rateCount"],
      id: json["_id"],
      title: json["title"],
      slug: json["slug"],
      description: json["description"],
      imgCover: json["imgCover"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      price: json["price"],
      priceAfterDiscount: json["priceAfterDiscount"],
      quantity: json["quantity"],
      category: json["category"],
      occasion: json["occasion"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      sold: json["sold"],
      discount: json["discount"],
      productId: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "rateAvg": rateAvg,
        "rateCount": rateCount,
        "_id": id,
        "title": title,
        "slug": slug,
        "description": description,
        "imgCover": imgCover,
        "images": images.map((x) => x).toList(),
        "price": price,
        "priceAfterDiscount": priceAfterDiscount,
        "quantity": quantity,
        "category": category,
        "occasion": occasion,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "sold": sold,
        "discount": discount,
        "id": productId,
      };

  ProductEntity toEntity() => ProductEntity(
        rateAvg: rateAvg,
        rateCount: rateCount,
        id: id,
        title: title,
        slug: slug,
        description: description,
        imgCover: imgCover,
        images: images,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        quantity: quantity,
        category: category,
        occasion: occasion,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
        sold: sold,
        discount: discount,
        productId: productId,
      );
}
