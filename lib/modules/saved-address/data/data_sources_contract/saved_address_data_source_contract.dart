import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/saved-address/domain/entities/saved_address_entity.dart';

abstract interface class SavedAddressDataSourceContract {
  Future<ApiResult<List<SavedAddressEntity>>> getSavedAddresses();
  Future<ApiResult<List<SavedAddressEntity>>> deleteAddress(String addressId);
}
