class AddToCartRequest {
  String? product;
  int? quantity;

  AddToCartRequest({
    this.product,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product;
    data['quantity'] = quantity;
    return data;
  }
}
