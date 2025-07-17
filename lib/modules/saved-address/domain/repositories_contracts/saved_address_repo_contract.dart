import '../../../../core/apis/api_result/api_result.dart';
import '../entities/saved_address_entity.dart';

abstract interface class SavedAddressRepoContract {
  Future<ApiResult<List<SavedAddressEntity>>> getSavedAddresses();
  Future<ApiResult<List<SavedAddressEntity>>> deleteAddress(String addressId);
}
