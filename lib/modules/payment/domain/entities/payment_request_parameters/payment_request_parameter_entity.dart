import 'package:equatable/equatable.dart';

class PaymentRequestParametersEntity  extends Equatable{
  const PaymentRequestParametersEntity({
    required this.shippingAddress,
  });

  final ShippingAddressEntity shippingAddress;

  @override
  List<Object?> get props => [shippingAddress];
}

class ShippingAddressEntity extends Equatable{
  const ShippingAddressEntity({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
  });

  final String street;
  final String phone;
  final String city;
  final String lat;
  final String long;

  @override
  List<Object?> get props => [street,phone,city,long,lat];
}
