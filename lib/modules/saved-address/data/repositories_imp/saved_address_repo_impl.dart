import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/saved-address/data/data_sources_contract/saved_address_data_source_contract.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories_contracts/saved_address_repo_contract.dart';

@Injectable(as: SavedAddressRepoContract)
class SavedAddressRepoImpl implements SavedAddressRepoContract {
  SavedAddressRepoImpl(this._savedAddressDataSourceContract);
  final SavedAddressDataSourceContract _savedAddressDataSourceContract;
  @override
  Future<ApiResult<List<AddressEntity>>> deleteAddress(
      String addressId) async {
    return await _savedAddressDataSourceContract.deleteAddress(addressId);
  }

  @override
  Future<ApiResult<List<AddressEntity>>> getSavedAddresses() async {
    return await _savedAddressDataSourceContract.getSavedAddresses();
  }
}
