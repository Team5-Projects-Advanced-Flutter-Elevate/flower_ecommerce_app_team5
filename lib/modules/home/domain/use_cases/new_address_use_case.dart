import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/new_address_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/new_address_response.dart';

@injectable
class NewAddressUseCase {
  NewAddressRepo repository;

  NewAddressUseCase(this.repository);

  Future<void> call(var street,var phone,var city,var lat,var long,var name) {
    return repository.addAddress(street,phone,city,lat,long,name);
  }
}
