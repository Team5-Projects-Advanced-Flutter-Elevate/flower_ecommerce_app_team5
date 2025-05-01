import 'dart:developer';
import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../api/api_client/saved_address_api_client.dart';
import '../../data_sources_contract/saved_address/delete_address_remote_data_source.dart';
import '../../models/saved_address_response/saved_address_response_dto.dart';

@Injectable(as: DeleteAddressRemoteDataSource)
class DeleteAddressRemoteDataSourceImp implements DeleteAddressRemoteDataSource {
  SavedAddressApiClient deleteAddressApiClient;

  DeleteAddressRemoteDataSourceImp(this.deleteAddressApiClient);

  @override
  Future<ApiResult<SavedAddressResponseDto>> deleteAddress(String productId) async {
    var apiResult = await ApiExecutor.executeApi<SavedAddressResponseDto>(
          () async {
        return deleteAddressApiClient.deleteSavedAddress(productId);
      },
    );
    switch (apiResult) {
      case Success<SavedAddressResponseDto>():
        log("Address ${apiResult.data}");
        return Success(data: (apiResult.data));
      case Error<SavedAddressResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
