import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_model_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'cart_item_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: '_id')
  final String? id;
  final String? user;
  final List<CartItemModel>? cartItems;
  final double? discount;
  final double? totalPrice;
  @JsonKey(name: 'totalPriceAfterDiscount')
  final double? totalPriceAfterDiscount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  Cart({
    this.id,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);

  CartModelEntity toEntity() => CartModelEntity(
        id: id,
        user: user,
        discount: discount,
        totalPrice: totalPrice,
        totalPriceAfterDiscount: totalPriceAfterDiscount,
        cartItems: cartItems?.map((e) => e.toEntity()).toList(),
      );
}
