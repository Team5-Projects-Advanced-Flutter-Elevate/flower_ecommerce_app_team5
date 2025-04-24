import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/data/api/api_client/check_out_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/data/models/address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../data_source_contract/chechout_data_souce_contract.dart';

@Injectable(as: CheckOutDataSource)
class CheckOutDataSourceImpl implements CheckOutDataSource {
  CheckOutApiClient checkOutApiClient;

  CheckOutDataSourceImpl(this.checkOutApiClient);

  @override
  Future<ApiResult<AddressResponseEntity>> getAllAddresses() async {
    var result = await ApiExecutor.executeApi(
        () async => await checkOutApiClient.getAllAddresses());
    switch (result) {
      case Success<AddressResponse>():
        return Success(data: result.data.toEntity());
      case Error<AddressResponse>():
        return Error(error: result.error);
    }
  }
}
