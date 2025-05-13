class OrderEntity {
  OrderEntity({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
    this.store,
    this.receivedUserOrderAt,
    this.preparedUserOrderAt,
    this.outForDeliveryAt,
    this.deliveredAt,
  });

  String? id;
  UserEntity? user;
  List<OrderItemEntity>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;
  StoreEntity? store;
  int? receivedUserOrderAt;
  int? preparedUserOrderAt;
  int? outForDeliveryAt;
  int? deliveredAt;
}

class StoreEntity {
  StoreEntity({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });

  String? name;
  String? image;
  String? address;
  String? phoneNumber;
  String? latLong;
}

class OrderItemEntity {
  OrderItemEntity({this.product, this.price, this.quantity, this.id});

  ProductEntity? product;
  num? price;
  num? quantity;
  String? id;
}

class ProductEntity {
  ProductEntity({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.sold,
  });

  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? discount;
  num? sold;
}

class UserEntity {
  UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
}
