import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/data/models/update_address_request.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/domain/repositories_contracts/update_address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateAddressUseCase {
  final UpdateAddressRepo _updateAddressRepo;
  UpdateAddressUseCase(this._updateAddressRepo);
  Future<ApiResult<String>> call(
      {required String addressId,
      required UpdateAddressRequest updateAddressRequest}) {
    return _updateAddressRepo.updateAddress(
        addressId: addressId, updateAddressRequest: updateAddressRequest);
  }
}
