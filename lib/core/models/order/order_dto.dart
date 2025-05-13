import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity.dart';
import 'package:flutter/foundation.dart';

/// _id : "68150be41433a666c8d91c6c"
/// user : {"_id":"680eb8861433a666c8d66efc","firstName":"Elevate","lastName":"Tech","email":"omar@gmail.com","gender":"male","phone":"+201010700999","photo":"default-profile.png"}
/// orderItems : [{"product":{"_id":"673e308c115992017182816d","title":"Moko Chocolate Set | Esperance Rose","slug":"moko-chocolate-set-or-esperance-rose","description":"Indulge in the ultimate chocolate experience with the Moko Chocolate Bundle! This delightful assortment features the Moko Cranberry White Chocolate Dragee and three irresistible 41% Milk Chocolate Bars Crunchy Hazelnut, Salted Caramel, and Crunchy Pistachio Praline. Perfect for satisfying your sweet cravings or as a thoughtful gift for someone special. Enjoy premium flavors and quality with every bite. Don’t wait treat yourself or a loved one to this delectable chocolate bundle. Buy now and make every moment sweeter!","imgCover":"aa6c2099-17db-4e81-85eb-2314cdaf31e8-cover_image.png","images":["081c1a80-67ae-4c5a-962b-894c9d32f6db-image_four.png","3a44160e-3a56-4aa5-91ae-b54ceb752f7d-image_one.png","c55c2f05-5d64-4086-b0be-3b383cee3fef-image_three.png","8b2708f3-4384-475e-b4e0-e7368b2a6e2f-image_two.png"],"price":1200,"priceAfterDiscount":900,"quantity":33279,"category":"673c479e1159920171827c99","occasion":"673b39241159920171827b28","createdAt":"2024-11-20T18:55:08.188Z","updatedAt":"2025-05-08T15:33:41.100Z","__v":0,"discount":50,"sold":1055},"price":1200,"quantity":3,"_id":"68150bd61433a666c8d91c34"}]
/// totalPrice : 1800
/// paymentType : "cash"
/// isPaid : false
/// isDelivered : false
/// state : "pending"
/// createdAt : "2025-05-02T18:16:04.804Z"
/// updatedAt : "2025-05-02T18:16:04.804Z"
/// orderNumber : "#124722"
/// __v : 0
/// store : {"name":"Elevate FlowerApp Store","image":"https://www.elevateegy.com/elevate.png","address":"123 Fixed Address, City, Country","phoneNumber":"1234567890","latLong":"37.7749,-122.4194"}
class OrderDto {
  OrderDto({
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

  factory OrderDto.fromJson(Map<String, dynamic>? json) {
    return OrderDto(
      id: json?["_id"],
      user: json?["user"] == null ? null : UserDto.fromJson(json?["user"]),
      orderItems:
          json?["orderItems"] == null
              ? []
              : List<OrderItemDto>.from(
                json?["orderItems"]!.map((x) => OrderItemDto.fromJson(x)),
              ),
      totalPrice: json?["totalPrice"],
      paymentType: json?["paymentType"],
      isPaid: json?["isPaid"],
      isDelivered: json?["isDelivered"],
      state: json?["state"],
      createdAt: json?["createdAt"] ?? "",
      updatedAt: json?["updatedAt"] ?? "",
      orderNumber: json?["orderNumber"],
      v: json?["__v"],
      store: json?["store"] == null ? null : StoreDto.fromJson(json?["store"]),
    );
  }

  String? id;
  UserDto? user;
  List<OrderItemDto>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;
  StoreDto? store;
  int? receivedUserOrderAt;
  int? preparedUserOrderAt;
  int? outForDeliveryAt;
  int? deliveredAt;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data['_id'] = id;
    if (user != null && user!.toJson().isNotEmpty) {
      data['user'] = user?.toJson();
    }
    if (orderItems != null) {
      data['orderItems'] = orderItems?.map((x) => x.toJson()).toList();
    }
    if (totalPrice != null) data['totalPrice'] = totalPrice;
    if (paymentType != null) data['paymentType'] = paymentType;
    if (isPaid != null) data['isPaid'] = isPaid;
    if (isDelivered != null) data['isDelivered'] = isDelivered;
    if (state != null) data['state'] = state;
    if (createdAt != null) data['createdAt'] = createdAt;
    if (updatedAt != null) data['updatedAt'] = updatedAt;
    if (orderNumber != null) data['orderNumber'] = orderNumber;
    if (v != null) data['__v'] = v;
    if (store != null && store!.toJson().isNotEmpty) {
      data['store'] = store?.toJson();
    }
    if (receivedUserOrderAt != null) {
      data['receivedUserOrderAt'] = receivedUserOrderAt;
    }
    if (preparedUserOrderAt != null) {
      data['preparedUserOrderAt'] = preparedUserOrderAt;
    }
    if (outForDeliveryAt != null) data['outForDeliveryAt'] = outForDeliveryAt;
    if (deliveredAt != null) data['deliveredAt'] = deliveredAt;
    debugPrint("In toJson of order dto $data");
    return data;
  }

  static OrderDto convertIntoDto(OrderEntity entity) {
    return OrderDto(
      id: entity.id,
      user: UserDto.convertIntoDto(entity.user),
      orderItems:
          entity.orderItems
              ?.map((e) => OrderItemDto.convertIntoDto(e))
              .toList(),
      totalPrice: entity.totalPrice,
      paymentType: entity.paymentType,
      isPaid: entity.isPaid,
      isDelivered: entity.isDelivered,
      state: entity.state,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      orderNumber: entity.orderNumber,
      v: entity.v,
      store: StoreDto.convertIntoDto(entity.store),
      receivedUserOrderAt: entity.receivedUserOrderAt,
      preparedUserOrderAt: entity.preparedUserOrderAt,
      outForDeliveryAt: entity.outForDeliveryAt,
      deliveredAt: entity.deliveredAt,
    );
  }

  OrderEntity convertIntoEntity() {
    return OrderEntity(
      id: id,
      user: user?.convertIntoEntity(),
      orderItems: orderItems?.map((e) => e.convertIntoEntity()).toList(),
      totalPrice: totalPrice,
      paymentType: paymentType,
      isPaid: isPaid,
      isDelivered: isDelivered,
      state: state,
      createdAt: createdAt,
      updatedAt: updatedAt,
      orderNumber: orderNumber,
      v: v,
      store: store?.convertIntoEntity(),
      receivedUserOrderAt: receivedUserOrderAt,
      preparedUserOrderAt: preparedUserOrderAt,
      outForDeliveryAt: outForDeliveryAt,
      deliveredAt: deliveredAt,
    );
  }
}

/// name : "Elevate FlowerApp Store"
/// image : "https://www.elevateegy.com/elevate.png"
/// address : "123 Fixed Address, City, Country"
/// phoneNumber : "1234567890"
/// latLong : "37.7749,-122.4194"
class StoreDto {
  StoreDto({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });

  factory StoreDto.fromJson(Map<String, dynamic> json) {
    return StoreDto(
      name: json["name"],
      image: json["image"],
      address: json["address"],
      phoneNumber: json["phoneNumber"],
      latLong: json["latLong"],
    );
  }

  String? name;
  String? image;
  String? address;
  String? phoneNumber;
  String? latLong;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (image != null) data['image'] = image;
    if (address != null) data['address'] = address;
    if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
    if (latLong != null) data['latLong'] = latLong;
    return data;
  }

  static StoreDto convertIntoDto(StoreEntity? entity) {
    return StoreDto(
      name: entity?.name,
      image: entity?.image,
      address: entity?.address,
      phoneNumber: entity?.phoneNumber,
      latLong: entity?.latLong,
    );
  }

  StoreEntity convertIntoEntity() {
    return StoreEntity(
      name: name,
      image: image,
      address: address,
      phoneNumber: phoneNumber,
      latLong: latLong,
    );
  }
}

/// product : {"_id":"673e308c115992017182816d","title":"Moko Chocolate Set | Esperance Rose","slug":"moko-chocolate-set-or-esperance-rose","description":"Indulge in the ultimate chocolate experience with the Moko Chocolate Bundle! This delightful assortment features the Moko Cranberry White Chocolate Dragee and three irresistible 41% Milk Chocolate Bars Crunchy Hazelnut, Salted Caramel, and Crunchy Pistachio Praline. Perfect for satisfying your sweet cravings or as a thoughtful gift for someone special. Enjoy premium flavors and quality with every bite. Don’t wait treat yourself or a loved one to this delectable chocolate bundle. Buy now and make every moment sweeter!","imgCover":"aa6c2099-17db-4e81-85eb-2314cdaf31e8-cover_image.png","images":["081c1a80-67ae-4c5a-962b-894c9d32f6db-image_four.png","3a44160e-3a56-4aa5-91ae-b54ceb752f7d-image_one.png","c55c2f05-5d64-4086-b0be-3b383cee3fef-image_three.png","8b2708f3-4384-475e-b4e0-e7368b2a6e2f-image_two.png"],"price":1200,"priceAfterDiscount":900,"quantity":33279,"category":"673c479e1159920171827c99","occasion":"673b39241159920171827b28","createdAt":"2024-11-20T18:55:08.188Z","updatedAt":"2025-05-08T15:33:41.100Z","__v":0,"discount":50,"sold":1055}
/// price : 1200
/// quantity : 3
/// _id : "68150bd61433a666c8d91c34"
class OrderItemDto {
  OrderItemDto({this.product, this.price, this.quantity, this.id});

  factory OrderItemDto.fromJson(Map<String, dynamic> json) {
    return OrderItemDto(
      product:
          json["product"] == null ? null : ProductDto.fromJson(json["product"]),
      price: json["price"],
      quantity: json["quantity"],
      id: json["_id"],
    );
  }

  ProductDto? product;
  num? price;
  num? quantity;
  String? id;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (product != null) data['product'] = product?.toJson();
    if (price != null) data['price'] = price;
    if (quantity != null) data['quantity'] = quantity;
    if (id != null) data['_id'] = id;
    return data;
  }

  static OrderItemDto convertIntoDto(OrderItemEntity entity) {
    return OrderItemDto(
      product: ProductDto.convertIntoDto(entity.product),
      price: entity.price,
      quantity: entity.quantity,
      id: entity.id,
    );
  }

  OrderItemEntity convertIntoEntity() {
    return OrderItemEntity(
      product: product?.convertIntoEntity(),
      price: price,
      quantity: quantity,
      id: id,
    );
  }
}

/// _id : "673e308c115992017182816d"
/// title : "Moko Chocolate Set | Esperance Rose"
/// slug : "moko-chocolate-set-or-esperance-rose"
/// description : "Indulge in the ultimate chocolate experience with the Moko Chocolate Bundle! This delightful assortment features the Moko Cranberry White Chocolate Dragee and three irresistible 41% Milk Chocolate Bars Crunchy Hazelnut, Salted Caramel, and Crunchy Pistachio Praline. Perfect for satisfying your sweet cravings or as a thoughtful gift for someone special. Enjoy premium flavors and quality with every bite. Don’t wait treat yourself or a loved one to this delectable chocolate bundle. Buy now and make every moment sweeter!"
/// imgCover : "aa6c2099-17db-4e81-85eb-2314cdaf31e8-cover_image.png"
/// images : ["081c1a80-67ae-4c5a-962b-894c9d32f6db-image_four.png","3a44160e-3a56-4aa5-91ae-b54ceb752f7d-image_one.png","c55c2f05-5d64-4086-b0be-3b383cee3fef-image_three.png","8b2708f3-4384-475e-b4e0-e7368b2a6e2f-image_two.png"]
/// price : 1200
/// priceAfterDiscount : 900
/// quantity : 33279
/// category : "673c479e1159920171827c99"
/// occasion : "673b39241159920171827b28"
/// createdAt : "2024-11-20T18:55:08.188Z"
/// updatedAt : "2025-05-08T15:33:41.100Z"
/// __v : 0
/// discount : 50
/// sold : 1055
class ProductDto {
  ProductDto({
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
    this.rateAvg,
    this.rateCount,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json["_id"],
      title: json["title"],
      slug: json["slug"],
      description: json["description"],
      imgCover: json["imgCover"],
      images:
          json["images"] == null
              ? []
              : List<String>.from(json["images"]!.map((x) => x)),
      price: json["price"],
      priceAfterDiscount: json["priceAfterDiscount"],
      quantity: json["quantity"],
      category: json["category"],
      occasion: json["occasion"],
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      v: json["__v"],
      discount: json["discount"],
      sold: json["sold"],
      rateAvg: json["rateAvg"],
      rateCount: json["rateCount"],
    );
  }

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
  num? rateAvg;
  num? rateCount;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data['_id'] = id;
    if (title != null) data['title'] = title;
    if (slug != null) data['slug'] = slug;
    if (description != null) data['description'] = description;
    if (imgCover != null) data['imgCover'] = imgCover;
    if (images != null) data['images'] = images?.map((x) => x).toList();
    if (price != null) data['price'] = price;
    if (priceAfterDiscount != null) {
      data['priceAfterDiscount'] = priceAfterDiscount;
    }
    if (quantity != null) data['quantity'] = quantity;
    if (category != null) data['category'] = category;
    if (occasion != null) data['occasion'] = occasion;
    if (createdAt != null) data['createdAt'] = createdAt;
    if (updatedAt != null) data['updatedAt'] = updatedAt;
    if (v != null) data['__v'] = v;
    if (discount != null) data['discount'] = discount;
    if (sold != null) data['sold'] = sold;
    if (rateAvg != null) data['rateAvg'] = rateAvg;
    if (rateCount != null) data['rateCount'] = rateCount;
    return data;
  }

  static ProductDto convertIntoDto(ProductEntity? entity) {
    return ProductDto(
      id: entity?.id,
      title: entity?.title,
      slug: entity?.slug,
      description: entity?.description,
      imgCover: entity?.imgCover,
      images: entity?.images,
      price: entity?.price,
      priceAfterDiscount: entity?.priceAfterDiscount,
      quantity: entity?.quantity,
      category: entity?.category,
      occasion: entity?.occasion,
      createdAt: entity?.createdAt,
      updatedAt: entity?.updatedAt,
      v: entity?.v,
      discount: entity?.discount,
      sold: entity?.sold,
    );
  }

  ProductEntity convertIntoEntity() {
    return ProductEntity(
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
      discount: discount,
      sold: sold,
    );
  }
}

/// _id : "680eb8861433a666c8d66efc"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "omar@gmail.com"
/// gender : "male"
/// phone : "+201010700999"
/// photo : "default-profile.png"
class UserDto {
  UserDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.passwordChangedAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json["_id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      gender: json["gender"],
      phone: json["phone"],
      photo: json["photo"],
      passwordChangedAt: json["passwordChangedAt"],
    );
  }

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? passwordChangedAt;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data['_id'] = id;
    if (firstName != null) data['firstName'] = firstName;
    if (lastName != null) data['lastName'] = lastName;
    if (email != null) data['email'] = email;
    if (gender != null) data['gender'] = gender;
    if (phone != null) data['phone'] = phone;
    if (photo != null) data['photo'] = photo;
    if (passwordChangedAt != null) {
      data['passwordChangedAt'] = passwordChangedAt;
    }
    return data;
  }

  static UserDto convertIntoDto(UserEntity? entity) {
    return UserDto(
      id: entity?.id,
      firstName: entity?.firstName,
      lastName: entity?.lastName,
      email: entity?.email,
      gender: entity?.gender,
      phone: entity?.phone,
      photo: entity?.photo,
    );
  }

  UserEntity convertIntoEntity() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
    );
  }
}
