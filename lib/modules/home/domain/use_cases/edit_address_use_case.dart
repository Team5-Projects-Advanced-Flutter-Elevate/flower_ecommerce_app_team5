import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/new_address_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class EditAddressUseCase {
  NewAddressRepo repository;

  EditAddressUseCase(this.repository);

   call(var street,var phone,var city,var lat,var long,var name,var id) {
    return repository.updateAddress(id: id, request: AddressEntity(street: street, phone: phone, city: city, lat: lat, long: long, username: name, id: id));
  }
}