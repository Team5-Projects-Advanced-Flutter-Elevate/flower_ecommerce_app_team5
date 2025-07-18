import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../repositories_contracts/saved_address_repo_contract.dart';

@injectable
class GetSavedAddressesUseCase {
  final SavedAddressRepoContract _repo;

  GetSavedAddressesUseCase(this._repo);

  Future<ApiResult<List<AddressEntity>>> call() {
    return _repo.getSavedAddresses();
  }
}
