import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_executor/api_executor.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../../domain/entities/saved_address_entity.dart';
import '../api/api_client/saved_address_api_client.dart';
import '../data_sources_contract/saved_address_data_source_contract.dart';
import '../models/saved_address_dto.dart';

@Injectable(as: SavedAddressDataSourceContract)
class SavedAddressDataSourceImp implements SavedAddressDataSourceContract {
  final SavedAddressApiClient _apiClient;

  SavedAddressDataSourceImp(this._apiClient);

  @override
  Future<ApiResult<List<SavedAddressEntity>>> deleteAddress(
      String addressId) async {
    var result = await ApiExecutor.executeApi(
      () => _apiClient.deleteAddress(addressId),
    );
    switch (result) {
      case Success<SavedAddressDto>():
        return Success<List<SavedAddressEntity>>(
            data: result.data.addresses.map((e) => e.toEntity()).toList());
      case Error<SavedAddressDto>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<List<SavedAddressEntity>>> getSavedAddresses() async {
    var result = await ApiExecutor.executeApi(
      () => _apiClient.getSavedAddresses(),
    );
    switch (result) {
      case Success<SavedAddressDto>():
        return Success<List<SavedAddressEntity>>(
            data: result.data.addresses.map((e) => e.toEntity()).toList());
      case Error<SavedAddressDto>():
        return Error(error: result.error);
    }
  }
}
