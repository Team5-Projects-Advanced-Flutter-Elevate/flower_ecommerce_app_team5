import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/product_do/product_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/cash_order_response/cash_order_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cash_order_response_dto.g.dart';

/// message : "success"
/// order : {"user":"67e31460836ee8be7062e3db","orderItems":[{"product":{"_id":"673e1cd711599201718280fb","title":"Wdding Flower","slug":"wdding-flower","description":"This is a Pack of White Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png","images":["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"],"price":440,"priceAfterDiscount":100,"quantity":3825,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T17:31:03.303Z","updatedAt":"2025-04-20T12:28:52.242Z","__v":0,"discount":50,"sold":837,"rateAvg":3.5,"rateCount":30,"id":"673e1cd711599201718280fb"},"price":440,"quantity":1,"_id":"68044848a9832d8359e539cb"}],"totalPrice":220,"paymentType":"cash","isPaid":false,"isDelivered":false,"state":"pending","_id":"6804e941a9832d8359e543c0","createdAt":"2025-04-20T12:32:01.480Z","updatedAt":"2025-04-20T12:32:01.480Z","orderNumber":"#124215","__v":0}

@JsonSerializable(createToJson: false)
class CashOrderResponseDto extends Equatable {
  CashOrderResponseDto({
    this.message,
    this.order,
  });

  factory CashOrderResponseDto.fromJson(dynamic json) =>
      _$CashOrderResponseDtoFromJson(json);
  String? message;
  OrderDto? order;

  CashOrderResponseEntity convertIntoEntity() {
    return CashOrderResponseEntity(
        message: message, order: order?.convertIntoEntity());
  }

  @override
  List<Object?> get props => [message, order];
}

/// user : "67e31460836ee8be7062e3db"
/// orderItems : [{"product":{"_id":"673e1cd711599201718280fb","title":"Wdding Flower","slug":"wdding-flower","description":"This is a Pack of White Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png","images":["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"],"price":440,"priceAfterDiscount":100,"quantity":3825,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T17:31:03.303Z","updatedAt":"2025-04-20T12:28:52.242Z","__v":0,"discount":50,"sold":837,"rateAvg":3.5,"rateCount":30,"id":"673e1cd711599201718280fb"},"price":440,"quantity":1,"_id":"68044848a9832d8359e539cb"}]
/// totalPrice : 220
/// paymentType : "cash"
/// isPaid : false
/// isDelivered : false
/// state : "pending"
/// _id : "6804e941a9832d8359e543c0"
/// createdAt : "2025-04-20T12:32:01.480Z"
/// updatedAt : "2025-04-20T12:32:01.480Z"
/// orderNumber : "#124215"
/// __v : 0

@JsonSerializable(createToJson: false)
class OrderDto extends Equatable {
  OrderDto({
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
  });

  factory OrderDto.fromJson(dynamic json) => _$OrderDtoFromJson(json);
  String? user;
  List<OrderItemDto>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;

  OrderEntity convertIntoEntity() {
    return OrderEntity(
        user: user,
        orderItems: orderItems
            ?.map(
              (e) => e.convertIntoEntity(),
            )
            .toList(),
        totalPrice: totalPrice,
        paymentType: paymentType,
        isPaid: isPaid,
        isDelivered: isDelivered,
        state: state,
        id: id,
        orderNumber: orderNumber,
        v: v);
  }

  @override
  List<Object?> get props => [
        user,
        orderItems,
        totalPrice,
        paymentType,
        isPaid,
        isDelivered,
        state,
        id,
        createdAt,
        updatedAt,
        orderNumber,
        v
      ];
}

/// product : {"_id":"673e1cd711599201718280fb","title":"Wdding Flower","slug":"wdding-flower","description":"This is a Pack of White Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png","images":["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"],"price":440,"priceAfterDiscount":100,"quantity":3825,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T17:31:03.303Z","updatedAt":"2025-04-20T12:28:52.242Z","__v":0,"discount":50,"sold":837,"rateAvg":3.5,"rateCount":30,"id":"673e1cd711599201718280fb"}
/// price : 440
/// quantity : 1
/// _id : "68044848a9832d8359e539cb"

@JsonSerializable(createToJson: false)
class OrderItemDto extends Equatable {
  OrderItemDto({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  factory OrderItemDto.fromJson(dynamic json) => _$OrderItemDtoFromJson(json);
  ProductDto? product;
  num? price;
  num? quantity;
  String? id;

  OrderItemEntity convertIntoEntity() {
    return OrderItemEntity(
        product: product?.convertIntoEntity(),
        price: price,
        quantity: quantity,
        id: id);
  }

  @override
  List<Object?> get props => [product, price, quantity, id];
}
