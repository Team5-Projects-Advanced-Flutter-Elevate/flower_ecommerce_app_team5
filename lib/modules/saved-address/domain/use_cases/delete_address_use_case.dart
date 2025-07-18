import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../repositories_contracts/saved_address_repo_contract.dart';

@injectable
class DeleteAddressUseCase {
  final SavedAddressRepoContract _repo;

  DeleteAddressUseCase(this._repo);

  Future<ApiResult<List<AddressEntity>>> call(String addressId) {
    return _repo.deleteAddress(addressId);
  }
}
