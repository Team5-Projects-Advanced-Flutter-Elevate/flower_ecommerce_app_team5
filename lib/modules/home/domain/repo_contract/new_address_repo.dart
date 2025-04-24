import '../entities/new_address_response.dart';

abstract class NewAddressRepo {
  Future<void> addAddress(var street,var phone,var city,var lat,var long,var name);
}
