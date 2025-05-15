import 'package:flower_ecommerce_app_team5/core/models/product/product_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  @JsonKey(name: '_id')
  final String? id;
  final ProductDto? product;
  final double? price;
  final int? quantity;

  CartItemModel({
    this.id,
    this.product,
    this.price,
    this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  CartItemEntity toEntity() => CartItemEntity(
        id: id,
        price: price,
        quantity: quantity,
        productEntity: product?.convertIntoEntity(),
      );
}
