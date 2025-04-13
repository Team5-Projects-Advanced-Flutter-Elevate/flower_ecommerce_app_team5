import 'package:json_annotation/json_annotation.dart';
import 'cart_model.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponse {
  final String? message;
  @JsonKey(name: 'numOfCartItems')
  final int? numOfCartItems;
  final Cart? cart;

  CartResponse({
    this.message,
    this.numOfCartItems,
    this.cart,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
