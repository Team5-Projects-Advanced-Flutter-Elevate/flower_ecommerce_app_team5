import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/new_address_response/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/data/api/api_client/update_address_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/data/data_sources_contracts/update_address_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/update_address/data/models/update_address_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdateAddressRemoteDataSource)
class UpdateAddressRemoteDataSourceImp
    implements UpdateAddressRemoteDataSource {
  final UpdateAddressApiClient _updateAddressApiClient;
  UpdateAddressRemoteDataSourceImp(this._updateAddressApiClient);
  @override
  Future<ApiResult<String>> updateAddress(
      {required String addressId,
      required UpdateAddressRequest updateAddressRequest}) async {
    var result = await ApiExecutor.executeApi(
      () => _updateAddressApiClient.updateAddress(
          addressId, updateAddressRequest.toJson()),
    );
    switch (result) {
      case Success<SaveAddressResponse>():
        return Success(data: result.data.message ?? "");
      case Error<SaveAddressResponse>():
        return Error(error: result.error);
    }
  }
}
