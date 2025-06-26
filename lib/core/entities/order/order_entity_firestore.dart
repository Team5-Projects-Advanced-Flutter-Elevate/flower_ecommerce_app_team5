import '../order_item/order_item_entity.dart';

class OrderEntityFirestore {
  OrderEntityFirestore({
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

  @override
  String toString() {
    return 'Order{'
        'id: $id, '
        'user: $user, '
        'orderItems: $orderItems, '
        'totalPrice: $totalPrice, '
        'paymentType: $paymentType, '
        'isPaid: $isPaid, '
        'isDelivered: $isDelivered, '
        'state: $state, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'orderNumber: $orderNumber, '
        'v: $v'
        '}';
  }
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
