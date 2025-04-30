import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/data/models/saved_address_response/saved_address_response_dto.dart';

class SavedAddressResponseEntity extends Equatable {
  SavedAddressResponseEntity({
    required this.message,
    required this.address,
  });
final String? message;
static const String messageKey = "message";

final List<AddressEntity>? address;
static const String addressKey = "address";

  @override
  List<Object?> get props => [];
}
