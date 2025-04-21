class PaymentRequestParametersEntity {
  PaymentRequestParametersEntity({
    required this.shippingAddress,
  });

  ShippingAddressEntity shippingAddress;
}

class ShippingAddressEntity {
  ShippingAddressEntity({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
  });

  String street;
  String phone;
  String city;
  String lat;
  String long;
}
