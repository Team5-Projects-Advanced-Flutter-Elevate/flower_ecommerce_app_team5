import '../../../modules/home/data/models/product_do/product_dto.dart';

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