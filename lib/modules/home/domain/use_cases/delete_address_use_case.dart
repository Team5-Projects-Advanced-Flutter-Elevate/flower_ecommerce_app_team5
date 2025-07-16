import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/new_address_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class DeleteAddressUseCase {
  NewAddressRepo repository;

  DeleteAddressUseCase(this.repository);

   call(var id) {
    return repository.deleteAddress(id: id,);
  }
}