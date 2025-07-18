import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';

import '../../../../core/apis/api_result/api_result.dart';

abstract interface class SavedAddressRepoContract {
  Future<ApiResult<List<AddressEntity>>> getSavedAddresses();
  Future<ApiResult<List<AddressEntity>>> deleteAddress(String addressId);
}
