import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';

abstract interface class CheckOutRepo {
  Future<ApiResult<AddressResponseEntity>> getAllAddresses();
}
