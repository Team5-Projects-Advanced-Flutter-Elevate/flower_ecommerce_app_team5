import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/saved-address/data/data_sources_contract/saved_address_data_source_contract.dart';
import 'package:flower_ecommerce_app_team5/modules/saved-address/domain/entities/saved_address_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories_contracts/saved_address_repo_contract.dart';

@Injectable(as: SavedAddressRepoContract)
class SavedAddressRepoImpl implements SavedAddressRepoContract {
  SavedAddressRepoImpl(this._savedAddressDataSourceContract);
  final SavedAddressDataSourceContract _savedAddressDataSourceContract;
  @override
  Future<ApiResult<List<SavedAddressEntity>>> deleteAddress(
      String addressId) async {
    return await _savedAddressDataSourceContract.deleteAddress(addressId);
  }

  @override
  Future<ApiResult<List<SavedAddressEntity>>> getSavedAddresses() async {
    return await _savedAddressDataSourceContract.getSavedAddresses();
  }
}
