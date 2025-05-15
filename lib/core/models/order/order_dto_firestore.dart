import 'package:flower_ecommerce_app_team5/core/entities/order/order_entity_firestore.dart';
import 'package:flutter/foundation.dart';

import '../order_item/order_item_dto.dart';

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
class OrderDtoFirestore {
  OrderDtoFirestore({
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

  factory OrderDtoFirestore.fromJson(Map<String, dynamic>? json) {
    return OrderDtoFirestore(
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

  static OrderDtoFirestore convertIntoDto(OrderEntityFirestore entity) {
    return OrderDtoFirestore(
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

  OrderEntityFirestore convertIntoEntity() {
    return OrderEntityFirestore(
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
