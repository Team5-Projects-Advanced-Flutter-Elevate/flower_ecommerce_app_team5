import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/data/data_sources_contracts/update_address_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/data/models/update_address_request.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/domain/repositories_contracts/update_address_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdateAddressRepo)
class UpdateAddressRepoImp implements UpdateAddressRepo {
  final UpdateAddressRemoteDataSource _updateAddressRemoteDataSource;
  UpdateAddressRepoImp(this._updateAddressRemoteDataSource);
  @override
  Future<ApiResult<String>> updateAddress(
      {required String addressId,
      required UpdateAddressRequest updateAddressRequest}) {
    return _updateAddressRemoteDataSource.updateAddress(
        addressId: addressId, updateAddressRequest: updateAddressRequest);
  }
}
