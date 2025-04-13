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
}
