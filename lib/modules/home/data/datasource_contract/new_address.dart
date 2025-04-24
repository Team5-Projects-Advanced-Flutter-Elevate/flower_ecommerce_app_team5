import '../../domain/entities/new_address_response.dart';

abstract class NewAddressOnlineDataSource {
  Future<void> addAddress(var street,var phone,var city,var lat,var long,var name);
}
