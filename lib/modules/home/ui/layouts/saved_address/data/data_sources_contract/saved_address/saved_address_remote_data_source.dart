import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import '../../models/saved_address_response/saved_address_response_dto.dart';

abstract interface class SavedAddressRemoteDataSource {
  Future<ApiResult<SavedAddressResponseDto>> getSavedAddress(AddressEntity address);
}
