import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/data/models/update_address_request.dart';

abstract interface class UpdateAddressRepo {
  Future<ApiResult<String>> updateAddress(
      {required String addressId,
      required UpdateAddressRequest updateAddressRequest});
}
