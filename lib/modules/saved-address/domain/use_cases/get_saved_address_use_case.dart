import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../entities/saved_address_entity.dart';
import '../repositories_contracts/saved_address_repo_contract.dart';

@injectable
class GetSavedAddressesUseCase {
  final SavedAddressRepoContract _repo;

  GetSavedAddressesUseCase(this._repo);

  Future<ApiResult<List<SavedAddressEntity>>> call() {
    return _repo.getSavedAddresses();
  }
}
