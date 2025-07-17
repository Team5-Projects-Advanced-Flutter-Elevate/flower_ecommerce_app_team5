import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../entities/saved_address_entity.dart';
import '../repositories_contracts/saved_address_repo_contract.dart';

@injectable
class DeleteAddressUseCase {
  final SavedAddressRepoContract _repo;

  DeleteAddressUseCase(this._repo);

  Future<ApiResult<List<SavedAddressEntity>>> call(String addressId) {
    return _repo.deleteAddress(addressId);
  }
}
