import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import '../../../data/models/saved_address_response/saved_address_response_dto.dart';
import '../../entities/saved_address/saved_address_response_entity.dart';

abstract interface class UpdateAddressRepository {
  Future<ApiResult<SavedAddressResponseEntity>> updateAddress(AddressEntity address,String productId);
}
